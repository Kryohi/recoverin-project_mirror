# Project Makefile.
# The results and figures should be reproducible from the functions/code/scripts in src,
# the data in data/external and/or data/raw and the steps in this makefile.
####################################################################
# I am a comment, and I want to say that the variable CC will be
# the compiler to use.
#
SH=/bin/bash
BINDIR=./bin
#CFLAGS=-c -Wall

#all: git_initialize get_software_stack get_conda 
all: get_software_stack get_conda

get_software_stack:$(BINDIR)/prepare.sh 
	$(SH) $(BINDIR)/prepare.sh

get_conda:$(BINDIR)/get_conda.sh 
	$(SH) $(BINDIR)/get_conda.sh

#hello_world.txt: hello_world.sh
#	$(SH) hello_world.sh

#clean:
#	rm hello_world.txt
