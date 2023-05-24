## Annotation of raw metaG reads with diamond and MEGAN

```
#get NCBI nr database, file is large (146 GB)
#replace curl with wget on HPCC/Linux
curl https://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz -output nr.gz

#decompress the file (gunzip -d on linux shell)
unzip nr.gz

#make a diamond database for analysis
diamond makedb --in nr -out --db nr

#run diamond (on lab Mac is installed under anvio-7.1, if on cluster see sample job script for Chimera)
#source activate anvio-7.1

mv nt raw_reads
cd raw_reads
mkdir diamond_output
for i in *.gz
do
diamond blastx -d swissprot --daa ./diamond_output/$i.daa --query $i
done

#convert with MEGAN to summary per sample
```
