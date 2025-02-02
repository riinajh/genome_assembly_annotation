#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --partition=pibu_el8
#SBATCH --job-name=hifiasm
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/05.2_hifiasm_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/05.2_hifiasm_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

WORKDIR=/data/users/jriina/genome_assembly

apptainer exec --bind /data /containers/apptainer/hifiasm_0.19.8.sif hifiasm -o hifiasm_assembly/hifiasm -t 32 $WORKDIR/Pa-1/ERR11437314.fastq.gz 

awk '/^S/{print ">"$2;print $3}' hifiasm_assembly/hifiasm.bp.p_ctg.gfa > hifiasm_assembly/assembly.fa

