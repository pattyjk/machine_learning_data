## Convert data
```
#load QIIME
conda activate qiime2-2022.8

#convert QZA to sequences
qiime tools export \
  --input-path merged_repset_seqs.qza \
  --output-path seqs-output
```

## Run PICRUST pipeline
```
#load PICRUST
conda deactivate
conda activate picrust2

#run picrust
picrust2_pipeline.py -s seqs-output/dna-sequences.fasta -i asv_table.txt -o picrust2_out_pipeline -p 1
```
