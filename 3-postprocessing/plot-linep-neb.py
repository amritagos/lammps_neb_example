import numpy as np
from pathlib import Path
import matplotlib.pyplot as plt
import matplotlib.patheffects as path_effects
import matplotlib.lines as mlines

# Figure attributes 
input_file = "energy-step_36.dat" # Energy in kcal/mol 
conv_factor = 0.043361254529175 # Convert energies in kcal/mol to eV 

fig, ax1 = plt.subplots()

# Get the data 
data = np.loadtxt(input_file,skiprows=1) # Load the text file 
x_val = np.array(data[:,0]) # Reaction coordinate  
y_val =  np.array(data[:,1]) # Energy  
# Subtract the first value, to get the energy differences 
y_val = y_val - y_val[0]
y_val = y_val * conv_factor # Energies in eV 

# Actually make the plot 
ax1.set_xlabel('Reaction coordinate')
ax1.set_ylabel('Energy (eV)',labelpad=7)  # we already handled the x-label with ax1

(path,) = ax1.plot(x_val, y_val, marker="^", color="lightsalmon", linewidth=2, markersize=4.5, 
   markerfacecolor="orangered",markeredgewidth=0.6, markeredgecolor="black",zorder=4,
   label = 'NEB Path')

# ax1.set_xlim([0,1.0])  
ax1.set_ylim([-0.01,0.5])
# ax1.set_yticks(np.arange(1.0,7.0,0.5))

# Uncomment for legend
# leg = ax1.legend(handles=[path], loc="upper left", ncol=1, fontsize=7.4)

fig.savefig('fig-neb-lp.png', dpi=300)

# plt.show()
