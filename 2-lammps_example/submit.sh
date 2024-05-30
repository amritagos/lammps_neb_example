#!/bin/bash -l
#
#SBATCH --nodes=1
#SBATCH --job-name=neb
#SBATCH --partition=any_cpu
#SBATCH --ntasks-per-node=64
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=amrita@hi.is

. ~/lammps-bashrc/.bashrc
export lmpdir=$HOME/lammps-23Jun2022/build

mpirun -n 64 $lmpdir/lmp -partition 64x1 -in in.neb.hop
