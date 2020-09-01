#!/bin/tcsh
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=30GB
#SBATCH --export=ALL
#SBATCH -t 150:00:00
#SBATCH -J nt559_oh
#SBATCH -o nt559_oh.o%j

source /usr/share/Modules/init/tcsh
set echo
hostname

module load psi4.conda/1.1
setenv PSI_SCRATCH /scratch/$GROUP/$USER
ps4 -i nt559_oh.in -o nt559_oh.out -n 2
