# tfilm

## Download Required Libraries

```
pip install tensorflow==2.4.1
pip install keras==2.4.0
pip install numpy==1.19.5
pip install scipy==1.6.0
pip install librosa==0.8.0
pip install h5py==2.10.0
pip install matplotlib==3.3.4
```

## Downloading Preprocessed Data Files

Download the following h5 files from [here](https://drive.google.com/file/d/1oZzpElVAkfLuM8PyYyf1PiTyUD_qSNaq/view?usp=sharing):
- vctk-speaker1-train.4.16000.32000.32000.h5
- vctk-speaker1-val.4.16000.32000.32000.h5

## Run the Model

```
python src/run.py train \
   --train <relative-path-to-local-directory>/vctk-speaker1-train.4.16000.32000.32000.h5 \
   --val <-relative-path-to-local-directory>/vctk-speaker1-val.4.16000.32000.32000.h5 \
   -e <n_epochs> \
   --batch-size 16 \
   --lr 3e-4 \
   --logname valentini \
   --model audiotfilm \
   --r 4 \
   --layers 4 \
   --piano false \
   --pool_size 2 \
   --strides 2 \
   --full false
```
   
This will output the trained model to output directory: something like ```valentini.lr0.000300.1.g4.b16```
   
## Enhance files
   
```
python src/run.py eval \
  --logname <relateive path to output directory containining trained model>/model.ckpt-49 \
  --out-label valentini-out \
  --in-dir <absolute path to directory containing test wav files> \
  --out-dir <absolute path to empty directory to dump enhanced files> \
  --wav-file-list ./data/vctk/valentini/valentini-test-files.txt \
  --r 4 \
  --pool_size 2 \
  --strides 2 \
  --model audiotfilm
```

