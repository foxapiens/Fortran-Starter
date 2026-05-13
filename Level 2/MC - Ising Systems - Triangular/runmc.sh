#!/bin/bash
date

gfortran mcsimtri.f90 -o mcsimtri.out
./mcsimtri.out
python3 parameter_drawer.py
gfortran mcsimtri_critialtemp.f90
./a.out 
python3 critical_point_drawer.py

date
