#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=jellyfish
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/04_jellyfish_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/04_jellyfish_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

WORKDIR=/data/users/jriina/genome_assembly

module load Jellyfish/2.3.0-GCC-10.3.0

jellyfish count -C -m 21 -s 5G -t 4 <(zcat $WORKDIR/processed_reads/dna.fastq.gz) -o $WORKDIR/processed_reads/dna_reads.jf

jellyfish count -C -m 21 -s 5G -t 4 <(zcat $WORKDIR/processed_reads/rna1.fastq.gz) <(zcat $WORKDIR/processed_reads/rna2.fastq.gz) -o $WORKDIR/processed_reads/rna_reads.jf


jellyfish histo -t 4 $WORKDIR/processed_reads/dna_reads.jf > $WORKDIR/processed_reads/dna_reads.histo

jellyfish histo -t 4 $WORKDIR/processed_reads/rna_reads.jf > $WORKDIR/processed_reads/rna_reads.histo