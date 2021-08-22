#!/bin/tcsh
#SBATCH -p stdmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --mem=20G
#SBATCH --export=ALL
#SBATCH -t 1000:00:00
#SBATCH -J nt5520hts
#SBATCH -o nt5520hts.o%j

source /usr/share/Modules/init/tcsh
set echo
hostname

module load psi4conda/1.1
setenv PSI_SCRATCH /scratch/$GROUP/$USER
psi4 -i nt5520hts.in -o nt5520hts.out -n 10
