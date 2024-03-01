import os, sys
import gc

gc.collect()
os.environ['CUDA_LAUNCH_BLOCKING'] = "1"
# os.environ["CUDA_VISIBLE_DEVICES"] = "7"  

# import torch
# torch.cuda.set_device(device)

from sklearn.metrics import accuracy_score
# import swifter
import torch
device = torch.device("cuda")

from tqdm.notebook import tqdm
tqdm.pandas()

from utils.utils_init_dataset import set_seed, load_dataset_loader
from utils.utils_semantic_use import USE
from utils.utils_data_utils import DocumentSentimentDataset, DocumentSentimentDataLoader, EmotionDetectionDataset, EmotionDetectionDataLoader
from utils.utils_metrics import document_sentiment_metrics_fn
from utils.utils_init_model import text_logit, fine_tuning_model, eval_model, init_model, logit_prob, load_word_index
from utils.get_args import get_args

from attack.adv_attack import attack
from attack.attack_helper import read_dict
import os, sys


def main(
    model_target,
    downstream_task,
    attack_strategy,
    finetune_epoch,
    num_sample,
    exp_name,
    perturbation_technique,
    perturb_ratio,
    dataset,
    perturb_lang="id",
    seed=26092020
):
    print(exp_name)
    print(seed)

    set_seed(seed)
    use = USE()
    
    translator = None
    if perturbation_technique == "codemixing":
        translator = read_dict(os.getcwd() + r"/dicts/new_dict_"+perturb_lang+".txt")

    tokenizer, config, finetuned_model = init_model(model_target, downstream_task, seed)
    w2i, i2w = load_word_index(downstream_task)

    train_dataset, train_loader, train_path = load_dataset_loader(downstream_task, 'train', tokenizer)
    valid_dataset, valid_loader, valid_path = load_dataset_loader(downstream_task, 'valid', tokenizer)
    test_dataset, test_loader, test_path = load_dataset_loader(downstream_task, 'test', tokenizer)

    finetuned_model.to(device)
    # finetuned_model = fine_tuning_model(model, i2w, train_loader, valid_loader, finetune_epoch)

    if dataset == "valid":
        exp_dataset = valid_dataset.load_dataset(valid_path)
    elif dataset == "train":
        exp_dataset = train_dataset.load_dataset(train_path)
    elif dataset == "test":
        exp_dataset = test_dataset.load_dataset(test_path)
    # exp_dataset = dd.from_pandas(exp_dataset, npartitions=10)
    text,label = None,None

    # print(perturbation_technique)
    if downstream_task == 'sentiment':
        text = 'text'
        label = 'sentiment'
        exp_dataset[['perturbed_text', 'perturbed_semantic_sim', 'pred_label', 'pred_proba', 'perturbed_label', 'perturbed_proba', 'translated_word(s)', 'running_time(s)']] = exp_dataset.progress_apply(
            lambda row: attack(
                text_ls = row.text,
                true_label = row.sentiment,
                predictor = finetuned_model,
                tokenizer = tokenizer, 
                att_ratio = perturb_ratio,
                perturbation_technique = perturbation_technique,
                translator=translator,
                lang_codemix = perturb_lang,
                sim_predictor = use), axis=1, result_type='expand'
        )
    elif downstream_task == 'emotion':
        text = 'tweet'
        label = 'label'
        exp_dataset[['perturbed_text', 'perturbed_semantic_sim', 'pred_label', 'pred_proba', 'perturbed_label', 'perturbed_proba', 'translated_word(s)', 'running_time(s)']] = exp_dataset.progress_apply(
            lambda row: attack(
                text_ls = row.tweet,
                true_label = row.label,
                predictor = finetuned_model,
                tokenizer = tokenizer, 
                att_ratio = perturb_ratio,
                perturbation_technique = perturbation_technique,
                translator=translator,
                lang_codemix = perturb_lang,
                sim_predictor = use), axis=1, result_type='expand'
        )

    before_attack = accuracy_score(exp_dataset[label], exp_dataset['pred_label'])
    after_attack = accuracy_score(exp_dataset[label], exp_dataset['perturbed_label'])

    exp_dataset.loc[exp_dataset.index[0], 'before_attack_acc'] = before_attack
    exp_dataset.loc[exp_dataset.index[0], 'after_attack_acc'] = after_attack
    exp_dataset.loc[exp_dataset.index[0], 'avg_semantic_sim'] = exp_dataset["perturbed_semantic_sim"].mean()
    exp_dataset.loc[exp_dataset.index[0], 'avg_running_time(s)'] = exp_dataset["running_time(s)"].mean()
    exp_dataset.to_csv(os.getcwd() + r'/result/seed'+str(seed)+"/"+str(dataset)+"/"+str(exp_name)+".csv", index=False)
    


if __name__ == "__main__":
    args = get_args()
    
    path_to_res = os.getcwd() + r'/result/seed'+str(args.seed)+"/"+str(args.dataset)+"/"
    dir_list_res = os.listdir(path_to_res)
    
    if args.exp_name+".csv" not in dir_list_res:
        main(
            args.model_target,
            args.downstream_task,
            args.attack_strategy,
            args.finetune_epoch,
            args.num_sample,
            args.exp_name,
            args.perturbation_technique,
            args.perturb_ratio,
            args.dataset,
            args.perturb_lang,
            args.seed
        )