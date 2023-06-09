## Annomation of metagenomes on assembled reads
### Assemble reads with megahit
```
#bates dataset
#k list: 21,29,39,59,79,99,119,141
source activate megahit
cd /hpcstor6/scratch01/p/patrick.kearns/bates_metaG/Metagenomics_data_Bates_etal_2022
megahit -1 PNP16-303_R1_001.fastq.gz -2 PNP16-303_R2_001.fastq.gz --out-dir megahit_PNP16_303 --num-cpu-threads 64
megahit -1 PNP16-314_R1_001.fastq.gz -2 PNP16-314_R2_001.fastq.gz --out-dir megahit_PNP16_314 --num-cpu-threads 64
megahit -1 PNP16-321_R1_001.fastq.gz -2 PNP16-321_R2_001.fastq.gz --out-dir megahit_PNP16_321 --num-cpu-threads 64
megahit -1 PNP16-307_R1_001.fastq.gz -2 PNP16-307_R2_001.fastq.gz --out-dir megahit_PNP16_307 --num-cpu-threads 64
megahit -1 PNP16-316_R1_001.fastq.gz -2 PNP16-316_R2_001.fastq.gz --out-dir megahit_PNP16_316 --num-cpu-threads 64
megahit -1 PNP16-322_R1_001.fastq.gz -2 PNP16-322_R2_001.fastq.gz --out-dir megahit_PNP16_322 --num-cpu-threads 64
megahit -1 PNP16-308_R1_001.fastq.gz -2 PNP16-308_R2_001.fastq.gz --out-dir megahit_PNP16_308 --num-cpu-threads 64
megahit -1 PNP16-317_R1_001.fastq.gz -2 PNP16-317_R2_001.fastq.gz --out-dir megahit_PNP16_317 --num-cpu-threads 64
megahit -1 PNP16-323_R1_001.fastq.gz -2 PNP16-323_R2_001.fastq.gz --out-dir megahit_PNP16_323 --num-cpu-threads 64
megahit -1 PNP16-311_R1_001.fastq.gz -2 PNP16-311_R2_001.fastq.gz --out-dir megahit_PNP16_311 --num-cpu-threads 64
megahit -1 PNP16-319_R1_001.fastq.gz -2 PNP16-319_R2_001.fastq.gz --out-dir megahit_PNP16_319 --num-cpu-threads 64
megahit -1 PNP16-324_R1_001.fastq.gz -2 PNP16-324_R2_001.fastq.gz --out-dir megahit_PNP16_324 --num-cpu-threads 64
megahit -1 PNP16-312_R1_001.fastq.gz -2 PNP16-312_R2_001.fastq.gz --out-dir megahit_PNP16_312 --num-cpu-threads 64
megahit -1 PNP16-320_R1_001.fastq.gz -2 PNP16-320_R2_001.fastq.gz --out-dir megahit_PNP16_320 --num-cpu-threads 64
```
```
#joe's dataset

```

### Find genes with diamond
```
