#!/bin/tcsh
#SBATCH -p stdmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem=4G
#SBATCH --export=ALL
#SBATCH -t 300:00:00
#SBATCH -J nt559sw
#SBATCH -o nt559sw.o%j

source /usr/share/Modules/init/tcsh
set echo
hostname

module load psi4conda/1.1
setenv PSI_SCRATCH /scratch/$GROUP/$USER
psi4 -i nt559sw.in -o nt559sw.out -n 2
