#!/bin/bash

. /cs/labs/adiyoss/moshemandel/audio-super-res-2/venv-1/bin/activate
cd /cs/labs/adiyoss/moshemandel/audio-super-res-2

module load cuda/11.0 cudnn

python src/run.py train \
  --train ./data/vctk/speaker1/8-24/0.5-0.5/vctk-speaker1-train.3.24000.8192.4096.h5 \
  --val ./data/vctk/speaker1/8-24/0.5-0.5/vctk-speaker1-val.3.24000.8192.4096.h5 \
  -e 50 \
  --batch-size 64 \
  --lr 3e-4 \
  --logname singlespeaker-8-24 \
  --model audiotfilm \
  --r 3 \
  --layers 4 \
  --piano false \
  --pool_size 2 \
  --strides 2 \
  --full false