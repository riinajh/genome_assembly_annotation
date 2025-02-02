#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=fastqc
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/02_fastqc_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/02_fastqc_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

module load FastQC/0.11.9-Java-11

WORKDIR=/data/users/jriina/genome_assembly
dna=$WORKDIR/Pa-1/ERR11437314.fastq.gz
rna1=$WORKDIR/RNAseq_Sha/ERR754081_1.fastq.gz
rna2=$WORKDIR/RNAseq_Sha/ERR754081_2.fastq.gz

mkdir -p $WORKDIR/fastqc

output_dir=$WORKDIR/fastqc

fastqc $dna --outdir=$output_dir
fastqc $rna1 --outdir=$output_dir
fastqc $rna2 --outdir=$output_dir
