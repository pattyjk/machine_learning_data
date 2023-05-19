Analyze Bates et al. 2022, Microbiome 16S rRNA gene data
```
#pull data from ENA with bash script
sudo bash ena-file-download-20230518-1753.sh

#remove read 2 files
mkdir forward_reads
mkdir all_reads
cp *_1.fastq ./forward_reads
mv *.gz all_reads

#create manifest file that lists the sample names and the absolute path to the files

#import into QIIME2
qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-path bates_manifest.txt \
  --output-path single-end-demux.qza \
  --input-format SingleEndFastqManifestPhred33V2
  
#quality filer sequences
qiime quality-filter q-score \
 --i-demux single-end-demux.qza \
 --o-filtered-sequences bates_demux-filtered.qza \
 --o-filter-stats bates_demux-filter-stats.qza
 
  #call ASVs with deblur
  qiime deblur denoise-16S \
  --i-demultiplexed-seqs bates_demux-filtered.qza \
  --p-trim-length 120 \
  --o-representative-sequences bates_rep-seqs-deblur.qza \
  --o-table bates_table-deblur.qza \
  --p-sample-stats \
  --o-stats bates_deblur-stats.qza
  
 #export ASV table to text
 qiime tools export --input-path bates_table-deblur.qza --output-path bates_table
  
  #export rep set to fasta
   qiime tools export \
  --input-path 	bates_rep-seqs-deblur.qza \
  --output-path seqs-output
  
#run picrust
#load PICRUST
conda deactivate
conda activate picrust2

#run picrust pipeline
picrust2_pipeline.py -s seqs-output/dna-sequences.fasta -i bates_table/feature-table.biom -o bates_picrust2_out_pipeline -p 2
