#!/usr/bin/env bash

#SBATCH --partition=pibu_el8
#SBATCH --job-name=nucmer_mummer
#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/07_nucmer_mummer_%j.o
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/07_nucmer_mummer_%j.e

WORKDIR=/data/users/jriina/genome_assembly

mkdir -p mummer mummer/flye mummer/lja mummer/hifiasm

#apptainer exec --bind $WORKDIR /containers/apptainer/mummer4_gnuplot.sif nucmer --delta mummer/flye/comparing_assemblies.delta --threads 6 --breaklen 1000 --mincluster 1000 /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa $WORKDIR/flye_assembly/assembly.fasta
#apptainer exec --bind $WORKDIR /containers/apptainer/mummer4_gnuplot.sif nucmer --delta mummer/lja/comparing_assemblies.delta --threads 6 --breaklen 1000 --mincluster 1000 /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa $WORKDIR/lja_assembly/assembly.fasta
#apptainer exec --bind $WORKDIR /containers/apptainer/mummer4_gnuplot.sif nucmer --delta mummer/hifiasm/comparing_assemblies.delta --threads 6 --breaklen 1000 --mincluster 1000 /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa $WORKDIR/hifiasm_assembly/assembly.fa

apptainer exec\
 --bind $WORKDIR\
  /containers/apptainer/mummer4_gnuplot.sif\
  mummerplot -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
  -Q $WORKDIR/flye_assembly/assembly.fasta \
  --fat \
  --layout \
  --filter \
  -breaklen 1000\
  -t png\
  --large \
  -p mummer/flye/mummerplot_output\
  mummer/flye/comparing_assemblies.delta

  apptainer exec\
 --bind $WORKDIR\
  /containers/apptainer/mummer4_gnuplot.sif\
  mummerplot -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
  -Q $WORKDIR/lja_assembly/assembly.fasta \
  --fat \
  --layout \
  --filter \
  -breaklen 1000\
  -t png\
  --large \
  -p mummer/lja/mummerplot_output\
  mummer/lja/comparing_assemblies.delta

  apptainer exec\
 --bind $WORKDIR\
  /containers/apptainer/mummer4_gnuplot.sif\
  mummerplot -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
  -Q $WORKDIR/hifiasm_assembly/assembly.fa \
  --fat \
  --layout \
  --filter \
  -breaklen 1000\
  -t png\
  --large \
  -p mummer/hifiasm/mummerplot_output\
  mummer/hifiasm/comparing_assemblies.delta
