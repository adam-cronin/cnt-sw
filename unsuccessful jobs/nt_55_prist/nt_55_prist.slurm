#!/bin/tcsh
#SBATCH -p stdmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --mem=16G
#SBATCH --export=ALL
#SBATCH -t 150:00:00
#SBATCH -J nt_55_prist
#SBATCH -o nt_55_prist.o%j

source /usr/share/Modules/init/tcsh
set echo
hostname

module load psi4conda/1.1
setenv PSI_SCRATCH /scratch/$GROUP/$USER
psi4 -i nt_55_prist.in -o nt_55_prist.out -n 10
