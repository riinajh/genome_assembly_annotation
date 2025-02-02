#!/usr/bin/env bash

#SBATCH --partition=pibu_el8
#SBATCH --job-name=fetch_data
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/01_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/01_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

wORKDIR=data/users/jriina/genome_assembly
cd $wORKDIR
mkdir -p logfiles
ln -s /data/courses/assembly-annotation-course/raw_data/Pa-1 ./
ln -s /data/courses/assembly-annotation-course/raw_data/RNAseq_Sha ./
