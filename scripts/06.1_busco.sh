#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --partition=pibu_el8
#SBATCH --job-name=busco
#SBATCH --output=/data/users/jriina/genome_assembly/logfiles/06.1_busco_%j.out
#SBATCH --error=/data/users/jriina/genome_assembly/logfiles/06.1_busco_%j.err
#SBATCH --mail-user=jacob.riina@students.unibe.ch
#SBATCH --mail-type=error,end

WORKDIR=/data/users/jriina/genome_assembly
#wget -P brassicales_ref https://busco-data.ezlab.org/v5/data/lineages/brassicales_odb10.2024-01-08.tar.gz
#mkdir $WORKDIR/brassicales_ref/lineages
#tar -xzvf $WORKDIR/brassicales_ref/brassicales_odb10.2024-01-08.tar.gz -C $WORKDIR/lineages

apptainer exec --bind /data /containers/apptainer/busco_5.7.1.sif busco --offline --download_path $WORKDIR/brassicales_ref -i $WORKDIR/flye_assembly/assembly.fasta --lineage brassicales_odb10 -m genome -c 8 -o BUSCO_flye
apptainer exec --bind /data /containers/apptainer/busco_5.7.1.sif busco --offline --download_path $WORKDIR/brassicales_ref -i $WORKDIR/lja_assembly/assembly.fasta --lineage brassicales_odb10 -m genome -c 8 -o BUSCO_lja
apptainer exec --bind /data /containers/apptainer/busco_5.7.1.sif busco --offline --download_path $WORKDIR/brassicales_ref -i $WORKDIR/hifiasm_assembly/assembly.fa --lineage brassicales_odb10 -m genome -c 8 -o BUSCO_hifi
