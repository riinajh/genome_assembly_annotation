#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=20G
#SBATCH --cpus-per-task=6
#SBATCH --partition=pibu_el8
#SBATCH --job-name=trinity
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/05.4_trinity_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/05.4_trinity_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

WORKDIR=/data/users/jriina/genome_assembly

module load Trinity/2.15.1-foss-2021a
Trinity --seqType fq --left $WORKDIR/RNAseq_Sha/ERR754081_1.fastq.gz --right $WORKDIR/RNAseq_Sha/ERR754081_2.fastq.gz --max_memory 20G --CPU 6 --output $WORKDIR/trinity_assembly