#!/bin/bash
command -v module
if [ $? -eq 0 ]; then
  module load python-3.7.2
fi
pip3 install --user cookiecutter
pip3 install --user gdown
python3.7 ./bin/get_gdrive_resources.py
