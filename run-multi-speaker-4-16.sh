#!/bin/bash

. /cs/labs/adiyoss/moshemandel/audio-super-res-2/venv-1/bin/activate
cd /cs/labs/adiyoss/moshemandel/audio-super-res-2

module load cuda/11.0 cudnn

python src/run.py train \
  --train ./data/vctk/multispeaker/non-aliased/0.5-0.5/vctk-multispeaker-interp-train.4.16000.8192.8192.0.25.h5 \
  --val ./data/vctk/multispeaker/non-aliased/0.5-0.5/vctk-multispeaker-interp-val.4.16000.8192.8192.0.25.h5 \
  -e 50 \
  --batch-size 64 \
  --lr 3e-4 \
  --logname singlespeaker-4-16 \
  --model audiotfilm \
  --r 4 \
  --layers 4 \
  --piano false \
  --pool_size 2 \
  --strides 2 \
  --full false \
  --speaker multi \