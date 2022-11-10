## Clustering of reads
```
#data from Becker and Julia
# import data from Becker
qiime tools import --type EMPSingleEndSequences --input-path /mnt/d/files\ for\ doug/ --output-path becker_seqs.qza

#julia's already in QZA format so no script needed


#demultiplex Julia

#demultiplex Becker
qiime demux emp-single \
  --i-seqs becker_seqs.qza \
  --m-barcodes-file sample-metadata.tsv \
  --m-barcodes-column barcode-sequence \
  --o-per-sample-sequences becker_demux.qza \
  --o-error-correction-details becker_demux-details.qza
```

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

## Run PICRUST pipeline withotu copy number correction 
```
picrust2_pipeline.py -s seqs-output/dna-sequences.fasta -i asv_table.txt -o picrust2_out_pipeline_no_norm -p 1 --skip_norm
```
