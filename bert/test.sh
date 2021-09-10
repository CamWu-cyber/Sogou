export BERT_BASE_DIR=/search/odin/wuwencan/bert-tag/data/pretrained_model/chinese_L-12_H-768_A-12
export DATA_DIR=/search/odin/wuwencan/bert-tag/data/datasets
export TRAINED_CLASSIFIER=/search/odin/wuwencan/bert-tag/data/model_output

python3 run_classifier.py \
  --task_name=querytag \
  --do_predict=true \
  --data_dir=$DATA_DIR \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$TRAINED_CLASSIFIER \
  --max_seq_length=128 \
  --output_dir=/search/odin/wuwencan/bert-tag/data/model_output \
  > logs/"test".log 2>&1