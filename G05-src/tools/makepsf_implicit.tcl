set script $argv0
cd ../../G05-data/00-external/recoverin/
pwd
mol new rec_r.pdb

set calcium [atomselect top "name CAL"]
$calcium writepdb calcium.pdb

set glym [atomselect top "resname GLM"]
$glym set resname GLYM
set protein [atomselect top "protein or resname GLYM"]
$protein writepdb protein.pdb

package require psfgen
resetpsf

topology ../../../G05-src/external/charmm_toppar_namd/top_all36_prot.rtf
topology ../../../G05-src/external/charmm_toppar_namd/top_all36_lipid.rtf
topology ../../../G05-src/external/charmm_toppar_namd/top_all36_na.rtf
topology ../../../G05-src/external/charmm_toppar_namd/top_all36_carb.rtf
topology ../../../G05-src/external/charmm_toppar_namd/top_all36_cgenff.rtf
topology ../../../G05-src/external/charmm_toppar_namd/toppar_water_ions_namd.str
topology ../../../G05-src/external/charmm_toppar_namd/stream/lipid/toppar_all36_lipid_prot.str
topology ../../../G05-src/external/charmm_toppar_namd/stream/lipid/toppar_all36_lipid_sphingo_mod.str

segment P {pdb protein.pdb 
	first none 
	last CNEU}
coordpdb protein.pdb

segment I {auto none 
	pdb calcium.pdb}
coordpdb calcium.pdb

pwd
guesscoord
writepsf rec_r_impl.psf
writepdb rec_r_impl.pdb


