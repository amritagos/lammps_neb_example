# NEB Initial Path 

## Procedure

Put your LAMMPS data files inside the initFinalData directory (Create the directory if required). Make sure that your data files are sorted. This will not work if the LAMMPS data files are not in the order of the IDs, which can happen if the files were generated from LAMMPS directly. 

Activate the environment. You can use the environment neb_example_env

```bash
micromamba activate neb_example_env
jupyter notebook
```
Run the Jupyter Notebook to obtain folders: nebInput and imageData. These can be used to set up a LAMMPS simulation.
