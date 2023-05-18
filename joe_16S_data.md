Processing fresh/museum samples for 16S rRNA gene/PICRUSt

```
#create manifest file that lists the sample names and the absolute path to the files
#import into QIIME2
qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-path joe_manifest_file.txt \
  --output-path single-end-demux.qza \
  --input-format SingleEndFastqManifestPhred33V2
  
#quality filer sequences
qiime quality-filter q-score \
 --i-demux single-end-demux.qza \
 --o-filtered-sequences joe_demux-filtered.qza \
 --o-filter-stats joe_demux-filter-stats.qza
 
  #call ASVs with deblur
  qiime deblur denoise-16S \
  --i-demultiplexed-seqs joe_demux-filtered.qza \
  --p-trim-length 120 \
  --o-representative-sequences joe_rep-seqs-deblur.qza \
  --o-table joe_table-deblur.qza \
  --p-sample-stats \
  --o-stats joe_deblur-stats.qza
  
  #export ASV table to text
 qiime tools export --input-path joe_table-deblur.qza --output-path joe_table
  
  #export rep set to fasta
   qiime tools export \
  --input-path merged_repset_seqs.qza \
  --output-path seqs-output
  
#run picrust
#load PICRUST
conda deactivate
conda activate picrust2

#run picrust pipeline
picrust2_pipeline.py -s seqs-output/dna-sequences.fasta -i joe_table/feature-table.biom -o joe_picrust2_out_pipeline -p 2
  ```
