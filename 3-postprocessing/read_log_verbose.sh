#!/bin/awk -f
# Execute like: awk -f 'program.awk' log.lammps
# ----------------------
# Writes the normalized reaction coordinate and the potential energy of each replica, 
# at a particular timestep value. One file is written out for every timestep value. 
# The LAMMPS master log.lammps file is read in and processed. 
# Please keep in mind that this is the
# lammps.log file written out when the 'verbose' keyword is specified in the 'neb' command. 
# ----------------------
# The data in the log.lammps file is in the format: 
# Step MaxReplicaForce MaxAtomForce GradV0 GradV1 GradVc EBF EBR RDT RD1 PE1 RD2 PE2 ... 
# RDN PEN pathangle1 angletangrad1 anglegrad1 gradV1 ReplicaForce1 MaxAtomForce1 pathangle2 angletangrad2 ... ReplicaForceN MaxAtomForceN
# ----------------------
BEGIN{
	stepNum = 0;
	currentStep = 0; # step of the current line being read in 
	prevStep = -1; # dummy value; prevents writing out the same data
	textDescription = "Reaction_Coordinate \t Energy";
}
{
	# Only write out lines with numeric data values and skip text lines
	if ($1 ~ /^[[:digit:]]/ ){
		currentStep = $1; # Current step value 
		#
		# Find out the number of replicas (only once, when stepNum is 0)
		if (stepNum==0){
			# NF is the number of fields
			numImages = (NF-8)/8;
			print "The number of images is", numImages;
		}
		#
		# Skip if this step has been written out already 
		if (prevStep==currentStep){next;}
		# 
		stepNum++; # Update the step number (also file number)
		print textDescription > "energy-step_"stepNum".dat";
		# Print reaction coordinate and energy for each image on a separate line 
		for (i=0; i<numImages; i++){
			print $(2*(i+5)), $(2*(i+5)+1) > "energy-step_"stepNum".dat"; 
		}
		#
		prevStep = currentStep;  # Update the 'previous step' value to compare the new current step 
		close("energy-step_"stepNum".dat")
	}
}