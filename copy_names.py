import subprocess
import time
import sys

Equip = "Phase2B"
Equip2 = "Phase2B"
for i in range(0,102):
    Get_PMT_CIN = 'odbedit -q -c "ls \'/Equipment/UCN2Epics'+Equip+'/Settings/Devices/UCN2'+Equip2+'/Channel name[' + str(i) + ']\' " '
    print(Get_PMT_CIN)
    PMT_CIN_Output = subprocess.check_output(Get_PMT_CIN, shell=True)
    print(PMT_CIN_Output)
    PMT_CIN_str = str(PMT_CIN_Output).split("\\n")

    index = str(PMT_CIN_Output).find("UCN2")

    if index != -1:
    
        substr = PMT_CIN_Output[index:]
        length = len(substr)
        substr2 = substr[0:length-1]
        
        #print("G" + PMT_CIN_str)
        #print(str(index))
        print(substr2)
        #print(str(len(PMT_CIN_str)))
        #print("ah")
        
        #Values = PMT_CIN_str[1].split(" ")
        Values = substr2
        
        print(Values)
        #nv = len(Values)
        #print(Values[nv-1])
        
        Set_CIN = 'odbedit -q -c "set /Equipment/UCN2Epics'+Equip+'/Settings/Names['+str(i)+'] ' + Values + ' " '
        
        print(Set_CIN)
        #PMT_CIN_Output = subprocess.check_output(Set_CIN, shell=True)
