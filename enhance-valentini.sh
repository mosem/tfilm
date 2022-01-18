#!/bin/bash

module load cuda

. /cs/labs/adiyoss/moshemandel/bwe/audio-super-res/audio-super-res-venv/bin/activate
cd /cs/labs/adiyoss/moshemandel/bwe/audio-super-res

python src/run.py eval \
  --logname ./valentini.lr0.000300.1.g4.b64/model.ckpt-20101 \
  --out-label valentini-out \
  --in-dir $1
  --out-dir $2
  --wav-file-list ./data/vctk/valentini/valentini-test-files.txt \
  --r 4 \
  --pool_size 2 \
  --strides 2 \
  --model audiotfilm
