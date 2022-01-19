#!/bin/bash

module load cuda

. /cs/labs/adiyoss/moshemandel/audio-super-res/audio-super-res-venv-2/bin/activate
cd /cs/labs/adiyoss/moshemandel/audio-super-res

python src/run.py eval \
  --logname ./valentini.lr0.000300.1.g4.b16/model.ckpt-49 \
  --out-label valentini-out \
  --in-dir /cs/labs/adiyoss/moshemandel/data/valentini/clean_testset_16k \
  --out-dir /cs/labs/adiyoss/moshemandel/audio-super-res/outputs/valentini-16k \
  --wav-file-list ./data/vctk/valentini/valentini-test-files.txt \
  --r 4 \
  --pool_size 2 \
  --strides 2 \
  --model audiotfilm
