#!/bin/bash
#
#PBS -N nt5520h_4
#PBS -l select=1:ncpus=12:mem=10gb
#PBS -l walltime=240:00:00
#PBS -q skystd
#PBS -j oe

cd $PBS_O_WORKDIR
module load anaconda3/5.1.0-gcc/8.3.1
source activate p4env
psi4 -i ./nt5520h_4.in -o ./nt5520h_4.out
