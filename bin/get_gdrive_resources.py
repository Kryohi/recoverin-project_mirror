import gdown
import os
import tarfile
from collections import namedtuple

GdriveResource = namedtuple('GdriveResource','gdriveid tarname')

def download_extract(gdrive_res):
  base_id = 'https://drive.google.com/uc?id='
  gdown.download(base_id+gdrive_res.gdriveid, gdrive_res.tarname, quiet=False)
  with tarfile.open(gdrive_res.tarname) as tf:
    tf.extractall()

# Resources to download
namd_multicore = GdriveResource('1nizBonV174ec_isZyVfQq-17jXUmGOFR','NAMD_2.13_Linux-x86_64-multicore.tar.gz')
namd_cuda = GdriveResource('1zLjofNj6BINaQsQj1ve0cC9P5wBrvnZY','NAMD_2.13_Linux-x86_64-multicore-CUDA.tar.gz')
vmd = GdriveResource('1u8AY7D7qlUR_c-9-PUA_QNUSjKDEpeqC','vmd-1.9.3.bin.LINUX.tar.gz')
toppar = GdriveResource('1j3q2ntWir9dVfw4ZdgKvn7yWAC3UlBvY','charmm_toppar_c36_jul18_namd.tar.gz')

all_resources = (namd_multicore, namd_cuda, vmd, toppar)

# Actual execution
if __name__ == "__main__":
  ext_src ='./G05-src/external'
  print(f"Switching to directory {ext_src}")
  os.chdir(ext_src)
  for res in all_resources:
    download_extract(res)
