#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --partition=pibu_el8
#SBATCH --job-name=quast
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/06.2_quast_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/06.2_quast_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

WORKDIR=/data/users/jriina/genome_assembly

apptainer exec --bind $WORKDIR /containers/apptainer/quast_5.2.0.sif python /usr/local/bin/quast $WORKDIR/flye_assembly/assembly.fasta $WORKDIR/lja_assembly/assembly.fasta $WORKDIR/hifiasm_assembly/assembly.fa -o quast_results --labels flye,lja,hifiasm -e -r /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 
#--pacbio $WORKDIR/Pa-1/ERR11437314.fastq.gz
#--features /data/courses/assembly-annotation-course/references/TAIR10_GFF3_genes.gff