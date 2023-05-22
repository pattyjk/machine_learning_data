## Annotation of raw metaG reads with diamond and MEGAN

```
#get NCBI nr database, file is large (146 GB)
curl https://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz -output nr.gz

#decompress the file
unzip nr.gz

#make a diamond database for analysis
diamond makedb --in nr.gz --db nr

#run diamond (on lab Mac is installed under anvio-7.1)
source activate anvio-7.1
mv nt raw_reads
cd raw_reads
mkdir diamond_output
for i in *.gz
do
diamond blastx -d swissprot --daa ./diamond_output/$i.daa --fast --query $i
done

#convert with MEGAN to summary per sample
```
