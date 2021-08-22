#!/bin/tcsh
#SBATCH -p stdmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mem=20G
#SBATCH --export=ALL
#SBATCH -t 300:00:00
#SBATCH -J nt552h_3
#SBATCH -o nt5520h_3.o%j

source /usr/share/Modules/init/tcsh
set echo
hostname

module load psi4conda/1.1
setenv PSI_SCRATCH /scratch/$GROUP/$USER
psi4 -i nt5520h_3.in -o nt5520h_3.out -n 20
