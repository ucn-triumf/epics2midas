

import json

# These are the variables we will try to replace
controlwords = ["SourceEpics", "BeamlineEpics"]

qbfile = open("history_display_20190626.json", "r")

for line in qbfile:
    #print line
    sline = line.split('"')
    tofix = False
    controlword = ""
    # Find lines that specify variables
    if len(sline) > 2 and sline[1] == 'Variables':


        # Check if this is one of the variables names to fix
        for cword in controlwords:
            if cword in line:
                controlword = cword
                tofix = True

        # If so, go through and change the variables...
        if tofix is True:
                
            fixed_line = ""
            iline = 0
            for word in sline:
                if controlword in word:
                    fixed_word = ""
                    sword = word.split(':')
                    #print word
                
                    for byte in sword:
                        if controlword in byte:
                            fixed_word += byte + "/Measured:"
                        else:
                            if ' ' in byte:
                                byte = byte.replace(' ','_')
                                fixed_word += byte.lower()
                            else:
                                fixed_word += byte.lower() + "_"
                
                    fixed_line += fixed_word
                else:
                    fixed_line += word


                # Add the " back in...    
                iline += 1
                if iline < len(sline):
                    fixed_line += '"'


            print fixed_line,
        else:
            print line,
    else:
        print line,
