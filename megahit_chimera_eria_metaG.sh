#!/bin/bash

# Sample slurm submission script for the Chimera compute cluster
# Lines beginning with # are comments, and will be ignored by
# the interpreter.Lines beginning with #SBATCH are directives
# to the scheduler.These in turn can be commented out by
# adding a second # (e.g. ##SBATCH lines will not be processed
# by the scheduler).
#
#
# set name of job
#SBATCH --job-name=eria_metaG_megahit
#
# set the number of processors/tasks needed
#SBATCH -n 64

#set an account to use
#if not used then default will be used
# for scavenger users, use this format:
#BATCH --account=patrick.kearns
# for contributing users, use this format:
##SBATCH --account=

# set max wallclock timeDD-HH:MM:SS

# the default time will be 1 hour if not set
#SBATCH --time=00-96:00:00

# set a memory request
#SBATCH --mem=128gb

# Set filenames for stdout and stderr.%j can be used for the jobid.
# see "filename patterns" section of the sbatch man page for
# additional options
#SBATCH --error=%x-%j.err
#SBATCH --output=%x-%j.out
#

# set the partition where the job will run.Multiple partitions can
# be specified as a comma separated list
# Use command "sinfo" to get the list of partitions
#SBATCH --partition=DGXA100
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
cd /hpcstor6/scratch01/p/patrick.kearns/eria_metaG
megahit -1 SRR6491182_1.fastq.gz -2 SRR6491182_2.fastq.gz --out-dir megahit_SRR6491182 --num-cpu-threads 64
megahit -1 SRR6491185_1.fastq.gz -2 SRR6491185_2.fastq.gz --out-dir megahit_SRR6491185 --num-cpu-threads 64
megahit -1 SRR6491183_1.fastq.gz -2 SRR6491183_2.fastq.gz --out-dir megahit_SRR6491183 --num-cpu-threads 64
megahit -1 SRR6491184_1.fastq.gz -2 SRR6491184_2.fastq.gz --out-dir megahit_SRR6491184 --num-cpu-threads 64
megahit -1 SRR6491180_1.fastq.gz -2 SRR6491180_2.fastq.gz --out-dir megahit_SRR6491180 --num-cpu-threads 64
megahit -1 SRR6491181_1.fastq.gz -2 SRR6491181_2.fastq.gz --out-dir megahit_SRR6491181 --num-cpu-threads 64
#end