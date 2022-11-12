## Clustering of reads
```
#from https://docs.qiime2.org/2022.8/tutorials/moving-pictures/
#data from Becker and Julia
# import data from Becker
qiime tools import --type EMPSingleEndSequences --input-path ./becker_reads --output-path becker_seqs.qza

#julia's already in QZA format so no script needed

#demultiplex Becker
qiime demux emp-single \
  --i-seqs becker_seqs.qza \
  --m-barcodes-file Atelopus1_Mapping_File.txt \
  --m-barcodes-column BarcodeSequence \
  --o-per-sample-sequences becker_demux.qza \
  --o-error-correction-details becker_demux-details.qza \
  --p-no-golay-error-correction
  
 #call ASVs with deblur
 #quality filer firsts
qiime quality-filter q-score \
 --i-demux becker_demux.qza \
 --o-filtered-sequences becker_demux-filtered.qza \
 --o-filter-stats becker_demux-filter-stats.qza
 
  #call ASVs
  qiime deblur denoise-16S \
  --i-demultiplexed-seqs becker_demux-filtered.qza \
  --p-trim-length 120 \
  --o-representative-sequences becker_rep-seqs-deblur.qza \
  --o-table becker_table-deblur.qza \
  --p-sample-stats \
  --o-stats becker_deblur-stats.qza
```

## Convert data
```
#load QIIME
conda activate qiime2-2022.8

#convert QZA to sequences
qiime tools export \
  --input-path merged_repset_seqs.qza \
  --output-path seqs-output
  
  qiime tools export \
  --input-path becker_rep-seqs-deblur.qza \
  --output-path becker_seqs-output
  
  #convert QZA to ASV table for Becker data (already have for Julia's data)
  qiime tools export --input-path becker_table-deblur.qza --output-path becker_table
 ```

## Run PICRUST pipeline
```
#load PICRUST
conda deactivate
conda activate picrust2

#run picrust pipeline
picrust2_pipeline.py -s seqs-output/dna-sequences.fasta -i asv_table.txt -o julia_picrust2_out_pipeline -p 2
picrust2_pipeline.py -s becker_seqs-output/dna-sequences.fasta -i becker_table/feature-table.biom -o becker_picrust2_out_pipeline -p 2
```

## Run PICRUST pipeline without copy number correction 
```
picrust2_pipeline.py -s seqs-output/dna-sequences.fasta -i asv_table.txt -o picrust2_out_pipeline_no_norm -p 2 --skip_norm
picrust2_pipeline.py -s becker_seqs-output/dna-sequences.fasta -i becker_table/feature-table.biom -o becker_picrust2_out_pipeline_no_norm -p 2 --skip_norm
```
