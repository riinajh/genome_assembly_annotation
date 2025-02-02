#!/usr/bin/env bash

#SBATCH --partition=pibu_el8
#SBATCH --job-name=merqury
#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/06.4_merqury_%j.o
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/06.4_merqury_%j.e


# load modules


# set variables
WORKDIR=/data/users/jriina/genome_assembly
ASSEMBLY_HIFIASM=/data/users/jriina/genome_assembly/hifiasm_assembly/assembly.fa
ASSEMBLY_LJA=/data/users/jriina/genome_assembly/lja_assembly/assembly.fasta
ASSEMBLY_FLYE=/data/users/jriina/genome_assembly/flye_assembly/assembly.fasta
OUT_DIR=/data/users/jriina/genome_assembly/merqury
CONTAINER_SIF_MERQURY=/containers/apptainer/merqury_1.3.sif
CONTAINER_SIF_MERYL=/containers/apptainer/meryl_1.4.1.sif

# create directory if not available
mkdir -p $OUT_DIR $OUT_DIR/hifiasm/merq_out $OUT_DIR/flye/merq_out $OUT_DIR/lja/merq_out

# add MERQURY as a path variable in the script
export MERQURY="/usr/local/share/merqury"

# prepare meryl dbs
# get the right k size
# how i solved this:
#apptainer exec\
# --bind /data/users/amaalouf/transcriptome_assembly\
#  /containers/apptainer/merqury_1.3.sif\
#  sh $MERQURY/best_k.sh 140000000 
# output: tolerable collision rate: 0.001 \\ 18.5126
# so will pick k=19 for the rest
k=19

# build k-mer dbs with meryl
# done when running 006_1_run_meryl.sh

# run merqury
# Usage: merqury.sh <read-db.meryl> <asm1.fasta> <out>
#        <read-db.meryl> : k-mer counts of the read set
#        <asm1.fasta>    : Assembly fasta file (ex. pri.fasta, hap1.fasta or maternal.fasta)
#        <out>           : Output prefix
cd $OUT_DIR/hifiasm/merq_out
apptainer exec\
 --bind $WORKDIR\
  $CONTAINER_SIF_MERQURY\
  merqury.sh $OUT_DIR/merylout.meryl $ASSEMBLY_HIFIASM hifiasm


cd $OUT_DIR/flye/merq_out
apptainer exec\
 --bind $WORKDIR\
  $CONTAINER_SIF_MERQURY\
  merqury.sh $OUT_DIR/merylout.meryl $ASSEMBLY_FLYE flye


cd $OUT_DIR/lja/merq_out
apptainer exec\
 --bind $WORKDIR\
  $CONTAINER_SIF_MERQURY\
  merqury.sh $OUT_DIR/merylout.meryl $ASSEMBLY_LJA lja  