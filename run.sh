for size in base large
do
    for lang in en jw ms su
    do
        python main.py \
            --model_target LazarusNLP/NusaBERT-$size-EmoT \
            --downstream_task emotion \
            --attack_strategy adversarial \
            --finetune_epoch 10 --exp_name nusabert-$size-emotion-codemixing-$lang-adv-0.4-test \
            --perturbation_technique codemixing \
            --perturb_ratio 0.4 --dataset test --perturb_lang $lang --seed 26092020
    done
done

for size in base large
do
    for lang in en jw ms su
    do
        python main.py \
            --model_target LazarusNLP/NusaBERT-$size-SmSA \
            --downstream_task sentiment \
            --attack_strategy adversarial \
            --finetune_epoch 10 --exp_name nusabert-$size-sentiment-codemixing-$lang-adv-0.4-test \
            --perturbation_technique codemixing \
            --perturb_ratio 0.4 --dataset test --perturb_lang $lang --seed 26092020
    done
done