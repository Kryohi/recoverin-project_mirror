#!/bin/bash
#PBS -l select=1:ncpus=72
#PBS -q short_gpuQ
#PBS -N __name_to_be_displayed__
#PBS -o __something__.out
#PBS -e __something__.err
#PBS -M sebastiano.bontorin@studenti.unitn.it
#PBS -m abe # a-b-e means send email if the job is Aborted, Begins, Ends.

# parameters to be set

NAMD_EXE=__set_me__ #something like $HOME/path_to_namd/namd2
NAMD_CONF=__set_me__
LOG_FILE=__set_me__

cd ${PBS_O_WORKDIR}

# 72 is <= ncpus you require.
$NAMD_EXE +p72 +setcpuaffinity +devices 0 $NAMD_CONF > $LOG_FILE
