export BERT_BASE_DIR=/search/odin/wuwencan/bert-tag/data/pretrained_model/chinese_L-12_H-768_A-12
export DATA_DIR=/search/odin/wuwencan/bert-tag/data/datasets

python3 run_classifier.py \
  --task_name=querytag \
  --do_train=false \
  --do_eval=true \
  --data_dir=$DATA_DIR \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=32 \
  --learning_rate=2e-5 \
  --num_train_epochs=1.0 \
  --output_dir=/search/odin/wuwencan/bert-tag/data/model_output \
  > logs/"train".log 2>&1