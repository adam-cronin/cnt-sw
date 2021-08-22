#!/bin/bash
#
#PBS -N nt5520hts_rot0
#PBS -l select=1:ncpus=12:mem=75gb
#PBS -l walltime=240:00:00
#PBS -q skylm
#PBS -j oe

cd $PBS_O_WORKDIR
module load anaconda3/5.1.0-gcc/8.3.1
source activate p4env
export PSI_SCRATCH=/scratch1/adamcronin
psi4 -i ./nt5520hts_rot0.in -o ./nt5520hts_rot0.out
