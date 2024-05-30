# lammps_neb_example
A small example for a nudged-elastic band in LAMMPS, with the initial files created in ASE

## Installation of dependencies with [`micromamba`](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html)
I've used `micromamba` to manage dependencies (for ASE and Jupyter here). 
To install micromamba, execute
```bash
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
```
For details, refer to the micromamba docs [here](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html).


Then, create and activate the environment.

```bash
micromamba create -f environment.yml
micromamba activate neb_example_env
```

## Creation of Initial NEB Path

LAMMPS has some support for linear interpolation. However, this might not constrain rigid bonds. Instead, I use a hacky script to create an initial path (script and instructions inside `1-initial_files_ASE` directory). The script will create two output folders, given LAMMPS data files of the end points of the path. The output folders are called `nebInput` and `imageData`. Note that only the end point data files are required by LAMMPS (and the `nebInput` folder); however, `imageData` is useful for judging the quality of the initial path generated. 

## Running LAMMPS

This directory (`2-lammps_example`) includes an example for running LAMMPS on the Elja high-performance computing cluster, using the `nebInput` folder, and the two data files for the end points of the path. 