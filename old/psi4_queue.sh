#!/bin/bash
#
#PBS -N psi4-test
#PBS -l select=1:ncpus=10:mem=10gb
#PBS -l walltime=0:20:00
#PBS -q skystd
#PBS -j oe

cd $PBS_O_WORKDIR
module load anaconda3/5.1.0-gcc/8.3.1
source activate p4env
psi4 -i ./p4test.in -o ./p4test.out
