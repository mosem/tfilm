#!/bin/bash

module load cuda

. /cs/labs/adiyoss/moshemandel/bwe/audio-super-res/audio-super-res-venv/bin/activate
cd /cs/labs/adiyoss/moshemandel/bwe/audio-super-res


python src/run.py train \
  --train ./data/vctk/valentini/vctk-speaker1-train.4.16000.8192.4096.h5 \
  --val ./data/vctk/valentini/vctk-speaker1-val.4.16000.8192.4096.h5 \
  -e 1 \
  --batch-size 64 \
  --lr 3e-4 \
  --logname valentini \
  --model audiotfilm \
  --r 4 \
  --layers 4 \
  --piano false \
  --pool_size 2 \
  --strides 2 \
  --full true
