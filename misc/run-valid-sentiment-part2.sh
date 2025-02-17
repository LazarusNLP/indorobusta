# random_seed=24032022
random_seed=26092020
# random_seed=42
cuda_id=6



CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-en-adv-0.2-valid  --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid  --perturb_lang en --seed $random_seed  

CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-jw-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang jw --seed $random_seed  

CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-su-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang su --seed $random_seed 

CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-ms-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang ms --seed $random_seed 

CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-sr-adv-0.2-valid --perturbation_technique synonym_replacement --perturb_ratio 0.2 --dataset valid --seed $random_seed 


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-en-adv-0.2-valid  --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang en --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-jw-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang jw --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-su-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang su --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-ms-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang ms --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-sr-adv-0.2-valid --perturbation_technique synonym_replacement --perturb_ratio 0.2 --dataset valid --seed $random_seed 


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-en-adv-0.2-valid  --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang en --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-jw-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang jw --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-su-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang su --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-ms-adv-0.2-valid --perturbation_technique codemixing --perturb_ratio 0.2 --dataset valid --perturb_lang ms --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-sr-adv-0.2-valid --perturbation_technique synonym_replacement --perturb_ratio 0.2 --dataset valid --seed $random_seed 
















# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-en-adv-0.4-valid  --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang en --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-jw-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang jw --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-su-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang su --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-ms-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang ms --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-sr-adv-0.4-valid --perturbation_technique synonym_replacement --perturb_ratio 0.4 --dataset valid --seed $random_seed 


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-en-adv-0.4-valid  --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang en --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-jw-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang jw --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-su-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang su --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-ms-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang ms --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-sr-adv-0.4-valid --perturbation_technique synonym_replacement --perturb_ratio 0.4 --dataset valid --seed $random_seed 


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-en-adv-0.4-valid  --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang en --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-jw-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang jw --seed $random_seed  

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-su-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang su --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-ms-adv-0.4-valid --perturbation_technique codemixing --perturb_ratio 0.4 --dataset valid --perturb_lang ms --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-sr-adv-0.4-valid --perturbation_technique synonym_replacement --perturb_ratio 0.4 --dataset valid --seed $random_seed 







# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-en-adv-0.6-valid  --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang en --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-jw-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang jw --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-su-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang su --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-ms-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang ms --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-sr-adv-0.6-valid --perturbation_technique synonym_replacement --perturb_ratio 0.6 --dataset valid --seed $random_seed


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-en-adv-0.6-valid  --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang en --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-jw-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang jw --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-su-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang su --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-ms-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang ms --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-sr-adv-0.6-valid --perturbation_technique synonym_replacement --perturb_ratio 0.6 --dataset valid --seed $random_seed


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-en-adv-0.6-valid  --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang en --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-jw-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang jw --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-su-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang su --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-ms-adv-0.6-valid --perturbation_technique codemixing --perturb_ratio 0.6 --dataset valid --perturb_lang ms --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-sr-adv-0.6-valid --perturbation_technique synonym_replacement --perturb_ratio 0.6 --dataset valid --seed $random_seed


















# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-en-adv-0.8-valid  --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang en --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-jw-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang jw --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-su-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang su --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-codemixing-ms-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang ms --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target IndoBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name indobert-sentiment-sr-adv-0.8-valid --perturbation_technique synonym_replacement --perturb_ratio 0.8 --dataset valid --seed $random_seed


# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-en-adv-0.8-valid  --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang en --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-jw-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang jw --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-su-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang su --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-codemixing-ms-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang ms --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target XLM-R --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name xlmr-sentiment-sr-adv-0.8-valid --perturbation_technique synonym_replacement --perturb_ratio 0.8 --dataset valid --seed $random_seed


CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-en-adv-0.8-valid  --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang en --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-jw-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang jw --seed $random_seed 

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-su-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang su --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-codemixing-ms-adv-0.8-valid --perturbation_technique codemixing --perturb_ratio 0.8 --dataset valid --perturb_lang ms --seed $random_seed

# CUDA_VISIBLE_DEVICES=$cuda_id python3 main.py --model_target mBERT --downstream_task sentiment --attack_strategy adversarial --finetune_epoch 5 --exp_name mbert-sentiment-sr-adv-0.8-valid --perturbation_technique synonym_replacement --perturb_ratio 0.8 --dataset valid --seed $random_seed