import subprocess
import time
import sys

Equip = "Pha5Oth"
Equip2 = "Pha5Oth"

counter = 0
with open('phase5_other.txt') as topo_file:
    for line in topo_file:
        print line,
        value = line.rstrip()
        
        Set_device = 'odbedit -q -c "set \'/Equipment/UCN2Ep'+Equip+'/Settings/Devices/UCN2'+Equip2+'/Channel name['+str(counter)+']\' ' + value + '" '
        print(Set_device)
        PMT_CIN_Output = subprocess.check_output(Set_device, shell=True)  


        Set_name = 'odbedit -q -c "set \'/Equipment/UCN2Ep'+Equip+'/Settings/Names['+str(counter)+']\' ' + value + '" '
        print(Set_name)
        PMT_CIN_Output = subprocess.check_output(Set_name, shell=True)  


        counter = counter + 1

#        Get_PMT_CIN = 'odbedit -q -c "ls \'/Equipment/UCN2Ep'+Equip+'/Settings/Devices/UCN2'+Equip2+'/Channel name[' + str(0) + ']\' " '
 #       print(Get_PMT_CIN)
  #      PMT_CIN_Output = subprocess.check_output(Get_PMT_CIN, shell=True)
   #     print(PMT_CIN_Output)
    #    PMT_CIN_str = str(PMT_CIN_Output).split("\\n")
     #   
      #  index = str(PMT_CIN_Output).find("UCN2")
       # 

            
