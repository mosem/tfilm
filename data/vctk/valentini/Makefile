VALENTINI_DIR=/cs/labs/adiyoss/moshemandel/data/valentini/clean_dummyset_16k

# patch generation
SCA=4
TR_DIM=8192
TR_STR=4096
VA_DIM=8192
VA_STR=4096
SR=16000

# ----------------------------------------------------------------------------

patches:
	make \
		vctk-speaker1-train.$(SCA).$(SR).$(TR_DIM).$(TR_STR).h5 \
		vctk-speaker1-val.$(SCA).$(SR).$(VA_DIM).$(VA_STR).h5

# ----------------------------------------------------------------------------
# create dataset for one speaker

vctk-speaker1-train.%.$(SR).$(TR_DIM).$(TR_STR).h5: valentini-train-files.txt
	python ../prep_valentini.py \
		--file-list $< \
		--in-dir $(VALENTINI_DIR) \
		--out $@.tmp \
		--scale $* \
		--sr $(SR) \
		--dimension $(TR_DIM) \
		--stride $(TR_STR) \
		--interpolate \
		--low-pass
	mv $@.tmp $@

vctk-speaker1-val.%.$(SR).$(VA_DIM).$(VA_STR).h5: valentini-val-files.txt
	python ../prep_valentini.py \
		--file-list $< \
		--in-dir $(VALENTINI_DIR) \
		--out $@.tmp \
		--scale $* \
		--sr $(SR) \
		--dimension $(VA_DIM) \
		--stride $(VA_STR) \
		--interpolate \
		--low-pass
	mv $@.tmp $@
