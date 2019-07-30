#!/usr/bin/python

import sys
import subprocess
import os, time

harp = "harp0"

if len(sys.argv) > 1 and sys.argv[1] == 'harp2':
    harp = 'harp2'

print "Beamline magnet settings:"

os.system("caget B1U:SEPT:RDCUR")
os.system("caget B1U:YCB0:RDCUR")
os.system("caget B1U:B0:RDCUR")
os.system("caget B1U:Q1:VT:RDCUR")
os.system("caget B1U:XCB1:RDCUR")
os.system("caget B1U:YCB1:RDCUR")
os.system("caget B1U:Q2:RDCUR")

print "HARP readout"
PV = "B1U:"+harp.upper()+":HARPARR"


for i in range(5): 
    print "Try " + str(i)
    out = subprocess.check_output(['caget',PV]).split(" ")
    print "X: ",out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15],out[16],out[17],out[18]
    print "Y: ",out[19],out[20],out[21],out[22],out[23],out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31],out[32],out[33],out[34]
    
    time.sleep(2)
