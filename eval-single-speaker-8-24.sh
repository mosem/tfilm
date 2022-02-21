#!/bin/bash


. /cs/labs/adiyoss/moshemandel/audio-super-res-2/venv-1/bin/activate
cd /cs/labs/adiyoss/moshemandel/audio-super-res-2

module load cuda/11.0 cudnn/8.0.2


python src/run.py eval \
  --logname ./singlespeaker-8-24.lr0.000300.1.g4.b64/model.ckpt-4101 \
  --in-dir ./data/vctk/VCTK-Corpus/wav48/p225/ \
  --out-dir ./singlespeaker-8-24.lr0.000300.1.g4.b64/samples/ \
  --wav-file-list ./data/vctk/speaker1/speaker1-val-files.txt \
  --sr 24000 \
  --r 3 \
  --pool_size 2 \
  --strides 2 \
  --model audiotfilm
