VALENTINI_TR_DIR=/cs/labs/adiyoss/moshemandel/data/valentini/clean_trainset_16k
VALENTINI_VA_DIR=/cs/labs/adiyoss/moshemandel/data/valentini/clean_validset_16k

# patch generation
SCA=2
TR_DIM=32000
TR_STR=32000
VA_DIM=32000
VA_STR=32000
SR=16000

# ----------------------------------------------------------------------------

patches:
	make \
		valentini-train.$(SCA).$(SR).$(TR_DIM).$(TR_STR).h5 \
		valentini-val.$(SCA).$(SR).$(VA_DIM).$(VA_STR).h5 \
		valentini-train.$(SCA).$(SR).-1.$(TR_STR).h5 \
        valentini-val.$(SCA).$(SR).-1.$(VA_STR).h5

# ----------------------------------------------------------------------------
# create dataset for one speaker

valentini-train.$(SCA).$(SR).$(TR_DIM).$(TR_STR).h5: valentini-train-files.txt
	python ../prep_valentini.py \
		--file-list $< \
		--in-dir $(VALENTINI_TR_DIR) \
		--out $@.tmp \
		--scale $(SCA) \
		--sr $(SR) \
		--dimension $(TR_DIM) \
		--stride $(TR_STR) \
		--interpolate \
		--low-pass
	mv $@.tmp $@

valentini-val.$(SCA).$(SR).$(VA_DIM).$(VA_STR).h5: valentini-val-files.txt
	python ../prep_valentini.py \
		--file-list $< \
		--in-dir $(VALENTINI_VA_DIR) \
		--out $@.tmp \
		--scale $(SCA) \
		--sr $(SR) \
		--dimension $(VA_DIM) \
		--stride $(VA_STR) \
		--interpolate \
		--low-pass
	mv $@.tmp $@

valentini-train.$(SCA).$(SR).-1.$(TR_STR).h5: valentini-train-files.txt
	python ../prep_valentini.py \
		--file-list $< \
		--in-dir $(VALENTINI_TR_DIR) \
		--out $@.tmp \
		--scale $(SCA) \
		--sr $(SR) \
		--dimension -1 \
		--stride $(TR_STR) \
		--interpolate \
		--low-pass
	mv $@.tmp $@

valentini-val.$(SCA).$(SR).-1.$(VA_STR).h5: valentini-val-files.txt
	python ../prep_valentini.py \
		--file-list $< \
		--in-dir $(VALENTINI_VA_DIR) \
		--out $@.tmp \
		--scale $(SCA) \
		--sr $(SR) \
		--dimension -1 \
		--stride $(VA_STR) \
		--interpolate \
		--low-pass
	mv $@.tmp $@
