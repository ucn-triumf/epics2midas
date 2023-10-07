import subprocess
import time
import sys


for i in range(0,102):
    Get_PMT_CIN = 'odbedit -q -c "ls \'/Equipment/UCN2EpicsTemperatures/Settings/Devices/UCN2Temperatures/Channel name[' + str(i) + ']\' " '
    print(Get_PMT_CIN)
    PMT_CIN_Output = subprocess.check_output(Get_PMT_CIN, shell=True)
    print(PMT_CIN_Output)
    PMT_CIN_str = str(PMT_CIN_Output).split("\\n")
    
    #print(PMT_CIN_str)
    
    Values = PMT_CIN_str[1].split(" ")
    
    #print(Values)
    nv = len(Values)
    print(Values[nv-1])
    
    Set_CIN = 'odbedit -q -c "set /Equipment/UCN2EpicsTemperatures/Settings/Names['+str(i)+'] ' + Values[nv-1] + ' " '

    print(Set_CIN)
    PMT_CIN_Output = subprocess.check_output(Set_CIN, shell=True)
