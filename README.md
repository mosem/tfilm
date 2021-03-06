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

Download the following h5 files from [here](https://drive.google.com/drive/folders/1FzYfq6CQs1TT4YQ3vMhkEmmvuMHEkpeJ?usp=sharing):
- valentini-train.2.16000.32000.32000.h5
- valentini-val.2.16000.32000.32000.h5

If new data files should be generated with new segment lengths and dimensions, go to ```./data/vctk/valentini/Makefile``` and modify the following parameters:
- VALENTINI_TR_DIR - the absolute path to directory containing high-resolution tranining wav files.
- VALENTINI_VA_DIR - the absolute path to directory containing high-resolution validation wav files.
- TR_DIM, VA_DIM - required lengths of training/validation segments in number of samples.
- TR_STR, VA_STR - required lengths of strides of training/validation segments in number of samples.

## Train the Model

Run the following command from root directory to train audiotfilm model.

```
python src/run.py train \
   --train <relative-path-to-local-directory>/valentini-train.2.16000.32000.32000.h5 \
   --val <-relative-path-to-local-directory>/valentini-val.2.16000.32000.32000.h5 \
   -e <n_epochs> \
   --batch-size 128 \
   --lr 3e-4 \
   --logname valentini \
   --model audiotfilm \
   --r 2 \
   --layers 4 \
   --piano false \
   --pool_size 2 \
   --strides 2 \
   --full false
```
   
This will output the trained model to output directory: something like ```valentini.lr0.000300.1.g4.b16```
   
## Enhance Files

Run the following command from root directory to enhance files using trained model.
   
```
python src/run.py eval \
  --logname <relateive path to output directory containining trained model>/model.ckpt-49 \
  --out-label valentini-out \
  --in-dir <absolute path to directory containing test wav files> \
  --out-dir <absolute path to empty directory to dump enhanced files> \
  --wav-file-list ./data/vctk/valentini/valentini-test-files.txt \
  --r 2 \
  --pool_size 2 \
  --strides 2 \
  --model audiotfilm
```

