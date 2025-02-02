#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --partition=pibu_el8
#SBATCH --job-name=flye
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/05.1_flye_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/05.1_flye_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

module load Flye/2.9-GCC-10.3.0

WORKDIR=/data/users/jriina/genome_assembly

apptainer exec --bind /data /containers/apptainer/flye_2.9.5.sif flye --pacbio-hifi $WORKDIR/Pa-1/ERR11437314.fastq.gz --out-dir $WORKDIR/flye_assembly --threads 4