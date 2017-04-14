#!/usr/bin/python
# Simple script to grab the pressure values

import urllib2
import json

print "Dumping current UCN source pressures (from MIDAS)"
print "Pressures are mostly (except Convectrons) in mbar"

# Get names of variables
NamesRaw = urllib2.urlopen("http://daq12.triumf.ca/?cmd=jcopy&encoding=json&odb=/Equipment/SourceEpics/Settings/Names").read()
Names = json.loads(NamesRaw)["Names"]

# Get variable values
ValuesRaw = urllib2.urlopen("http://daq12.triumf.ca/?cmd=jcopy&encoding=json&odb=/Equipment/SourceEpics/Variables/Measured").read()
Values = json.loads(ValuesRaw)["Measured"]


SubSystems = ["VAC","ISO","HE4","HE3"];

for subsys in SubSystems:
    print "\nSubsystem " + subsys
    for i, name in enumerate(Names):
        if subsys in name and ("RDPRESS" in name or "RDVAC" in name):
            print name, Values[i]




