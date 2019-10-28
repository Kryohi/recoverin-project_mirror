#!/bin/bash

TARGET_DIR=./G05-src/external
MINICONDA_VER=Miniconda3-latest-Linux-x86_64.sh
MINICONDA_REPO=https://repo.anaconda.com/miniconda
conda_status=$(conda -v)
if [ $? != 0 ]; then
  echo ""
  echo "Conda not installed, downloading miniconda."
  echo "Switching to DIR $TARGET_DIR"
  cd $TARGET_DIR
  wget $MINICONDA_REPO/$MINICONDA_VER
  echo "Unloading any python module, if present."
  command -v module
  if [ $? -eq 0 ]; then
    module purge
  fi
  bash $MINICONDA_VER
fi
