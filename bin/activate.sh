#!/bin/bash
command -v module
if [ $? -eq 0 ]; then
  to_unload=$(module list | awk '$2~/python/ {print $2}')
  module unload < $to_unload
fi
conda activate QCB_project
