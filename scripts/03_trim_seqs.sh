#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=trim_seqs
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/03_trim_seqs_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/03_trim_seqs_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

module load fastp/0.23.4-GCC-10.3.0

WORKDIR=/data/users/jriina/genome_assembly

mkdir -p $WORKDIR/processed_reads
touch $WORKDIR/processed_reads/dna.fastq.gz
touch $WORKDIR/processed_reads/rna1.fastq.gz
touch $WORKDIR/processed_reads/rna2.fastq.gz

dna_file=$WORKDIR/Pa-1/ERR11437314.fastq.gz
rna_file1=$WORKDIR/RNAseq_Sha/ERR754081_1.fastq.gz
rna_file2=$WORKDIR/RNAseq_Sha/ERR754081_2.fastq.gz

fastp -LQA -i $dna_file -o $WORKDIR/processed_reads/dna.fastq.gz
#fastp -i $rna_file1 -o $WORKDIR/processed_reads/rna1.fastq.gz
#fastp -i $rna_file2 -o $WORKDIR/processed_reads/rna2.fastq.gz