#!/bin/tcsh
#SBATCH -p stdmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --mem=50G
#SBATCH --export=ALL
#SBATCH -t 150:00:00
#SBATCH -J nt559_oh
#SBATCH -o nt559_oh.o%j

source /usr/share/Modules/init/tcsh
set echo
hostname

module load psi4conda/1.1
setenv PSI_SCRATCH /scratch/$GROUP/$USER
psi4 -i nt559_oh.in -o nt559_oh.out -n 10
