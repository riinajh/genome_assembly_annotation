#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --partition=pibu_el8
#SBATCH --job-name=lja
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/05.3_lja%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/05.3_lja_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

WORKDIR=/data/users/jriina/genome_assembly

apptainer exec --bind /data /containers/apptainer/lja-0.2.sif lja -o lja_assembly --reads $WORKDIR/Pa-1/ERR11437314.fastq.gz 
