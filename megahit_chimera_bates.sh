#!/bin/bash

# Sample slurm submission script for the Chimera compute cluster
# Lines beginning with # are comments, and will be ignored by
# the interpreter.  Lines beginning with #SBATCH are directives
# to the scheduler.  These in turn can be commented out by
# adding a second # (e.g. ##SBATCH lines will not be processed
# by the scheduler).
#
#
# set name of job
#SBATCH --job-name=bates_megahit
#
# set the number of processors/tasks needed
#SBATCH -n 64

#set an account to use
#if not used then default will be used
# for scavenger users, use this format:
#BATCH --account=patrick.kearns
# for contributing users, use this format:
##SBATCH --account=

# set max wallclock time  DD-HH:MM:SS

# the default time will be 1 hour if not set
#SBATCH --time=00-96:00:00

# set a memory request
#SBATCH --mem=128gb

# Set filenames for stdout and stderr.  %j can be used for the jobid.
# see "filename patterns" section of the sbatch man page for
# additional options
#SBATCH --error=%x-%j.err
#SBATCH --output=%x-%j.out
#

# set the partition where the job will run.  Multiple partitions can
# be specified as a comma separated list
# Use command "sinfo" to get the list of partitions
#SBATCH --partition=Intel6240
##SBATCH --partition=Intel6240,Intel6248,DGXA100

#When submitting to the GPU node, these following three lines are needed:

##SBATCH --gres=gpu:1
##SBATCH --export=NONE
#source /etc/profile
 

#Optional
# mail alert at start, end and/or failure of execution
# see the sbatch man page for other options
#SBATCH --mail-type=ALL
# send mail to this address
#SBATCH --mail-user=patrick.kearns@umb.edu

# Put your job commands here, including loading any needed
# modules or diagnostic echos.
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
#end