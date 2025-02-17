from utils.utils_init_model import text_logit, fine_tuning_model, eval_model, init_model, logit_prob, load_word_index
import time
from nltk.tokenize import word_tokenize
import torch
import torch.nn.functional as F
import numpy as np
import math
from .attack_helper import get_synonyms, codemix_perturbation, codemix_perturbation_cache, synonym_replacement, swap_minimum_importance_words, trans_dict

import nltk
from nltk.corpus import stopwords
# nltk.download('stopwords')
stop_words_set = []
for w in stopwords.words('indonesian'):
    stop_words_set.append(w)

from icecream import ic
    
def attack(text_ls,
           true_label,
           predictor,
           tokenizer,
           att_ratio,
           perturbation_technique,
           translator=None,
           lang_codemix=None,
           sim_predictor=None,
           sim_score_threshold=0,
           sim_score_window=15,
           batch_size=32, 
           import_score_threshold=-1.):
    
    start_time = time.time()
    label_dict = {
        'positive': 0, 
        'neutral': 1, 
        'negative': 2}
    
    original_text = text_ls
    splitted_text = text_ls.split()
    
    orig_label, orig_probs, orig_prob = logit_prob(text_ls, predictor, tokenizer)
    
    if len(splitted_text) > sim_score_window:
        sim_score_threshold = 0.1  
    #     SEK SALAAHHHHHH
    if true_label != orig_label:
        running_time = round(time.time() - start_time, 2)
        # perturbed_text, perturbed_semantic_sim, orig_label, orig_probs, perturbed_label, perturbed_probs, translated_words, running_time
        orig_probs = np.round(orig_probs.detach().cpu().numpy().tolist(),4)
        return original_text, 1.000, orig_label, orig_probs, orig_label, orig_probs,'', running_time
    else:
        text_ls = splitted_text
#         isalnum karena kata yg ada nonalnum nya punya prediksi yang ga konsisten
        text_ls = [word for word in text_ls if word.isalnum()]
        len_text = len(text_ls)
        
        half_sim_score_window = (sim_score_window - 1) // 2
        
        leave_1_texts = [' '.join(text_ls[:ii] + [tokenizer.mask_token] + text_ls[min(ii + 1, len_text):]) for ii in range(len_text)]
        
        leave_1_probs = []
        leave_1_probs_argmax = []
        
        if len(text_ls) <=1:
            leave_1_probs_argmax, leave_1_probs, _ = logit_prob(leave_1_texts, predictor, tokenizer)
            leave_1_probs_argmax = [leave_1_probs_argmax]
            leave_1_probs = [leave_1_probs.detach().cpu().numpy()]
            # ic(leave_1_probs)
            leave_1_probs = torch.tensor(np.array(leave_1_probs)).to("cuda:0")
        else:
            leave_1_probs_argmax, leave_1_probs, _ = logit_prob(leave_1_texts, predictor, tokenizer,batch=True)
            leave_1_probs = torch.tensor(np.array(leave_1_probs.detach().cpu().numpy())).to("cuda:0")
        
        orig_prob_extended=np.empty(len_text)
        orig_prob_extended.fill(orig_prob)
        
        orig_prob_extended = torch.tensor(orig_prob_extended).to("cuda:0")
        
        arr1 = orig_prob_extended - leave_1_probs[:,orig_label] + float(leave_1_probs_argmax != orig_label)
        arr2 = (leave_1_probs.max(dim=-1)[0].to("cuda:0") - orig_probs[leave_1_probs_argmax].to("cuda:0"))
        
        import_scores = arr1*arr2
        import_scores = [im * -1 for im in import_scores]
        
        words_perturb = []
        for idx, score in sorted(enumerate(import_scores), key=lambda x: x[1], reverse=True):
            try:
                if score > import_score_threshold and text_ls[idx] not in stop_words_set:
                    words_perturb.append((idx, text_ls[idx], score.item()))
            except Exception as e:
                print(e)
                print(idx, len(text_ls), import_scores.shape, text_ls, len(leave_1_texts))
        
        num_perturbation = math.floor(len(words_perturb)*att_ratio)
        
        if num_perturbation < 1:
            num_perturbation = 1
        
#       top words perturb berisi list kata terpenting yang tidak akan diswitch ketika first_codemix_sim_score < sim_score_threshold
        top_words_perturb = words_perturb[:num_perturbation]
        trans_word = [twp[1] for twp in top_words_perturb]
        
        if perturbation_technique == "codemixing":
            perturbed_text,translated_words = codemix_perturbation_cache(text_ls, lang_codemix, top_words_perturb, translator)
        elif perturbation_technique == "synonym_replacement":
            perturbed_text,translated_words = synonym_replacement(text_ls, top_words_perturb)
        
        first_perturbation_sim_score = sim_predictor.semantic_sim(original_text, perturbed_text)
        
        words_perturb_candidates = []
        if first_perturbation_sim_score < sim_score_threshold:
            words_perturb_candidates.append(top_words_perturb)
            swapped = swap_minimum_importance_words(words_perturb, top_words_perturb)
            for s in swapped:
                words_perturb_candidates.append(s)

            words_perturb_candidates = [[tuple(w) for w in wpc] for wpc in words_perturb_candidates]

            candidate_comparison = {}
            for wpc in words_perturb_candidates:
                
                if perturbation_technique == "codemixing":
#                     bisa dicache, gaperlu request satu2
                    perturbed_candidate,translated_words = codemix_perturbation_cache(text_ls, lang_codemix, wpc, translator)
                elif perturbation_technique == "synonym_replacement":
                    perturbed_candidate,translated_words = synonym_replacement(text_ls, wpc)
                    
                perturbed_candidate_sim_score = sim_predictor.semantic_sim(original_text, perturbed_candidate)
                
                candidate_comparison[perturbed_candidate] = (perturbed_candidate_sim_score, wpc[-1][-1], wpc)

            sorted_candidate_comparison = sorted(candidate_comparison.keys(), key=lambda x: (float(candidate_comparison[x][0]), float(candidate_comparison[x][1])), reverse=True)

            perturbed_text = sorted_candidate_comparison[0]
            
            top_words_perturb = candidate_comparison[sorted_candidate_comparison[0]][-1]
            trans_word = [twp[1] for twp in top_words_perturb]
            
        perturbed_semantic_sim = sim_predictor.semantic_sim(original_text, perturbed_text)
        if perturbed_semantic_sim < sim_score_threshold:
            perturbed_text = original_text
            perturbed_semantic_sim = 1.000
        
        perturbed_label, perturbed_probs, perturbed_prob = logit_prob(perturbed_text, predictor, tokenizer)
        
        orig_probs = np.round(orig_probs.detach().cpu().numpy().tolist(),4)
        perturbed_probs = np.round(perturbed_probs.detach().cpu().numpy().tolist(),4)
        
        running_time = round(time.time() - start_time, 4)
        
        return perturbed_text, perturbed_semantic_sim, orig_label, orig_probs, perturbed_label, perturbed_probs, translated_words, running_time