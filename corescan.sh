#!/bin/bash

echo -e "\033[36m   ____                _____                 "
echo "  / __ \              /  ___\                           "
echo " | /  \/ ___  _ __ ___\ \`--.  ___ __ _ _ __            "
echo " | |    / _ \| '__/ _ \\\`--. \/ __/ _\` | '_ \         "
echo " | \__/\ (_) | | |  __/\__/ / (_| (_| | | | |           "
echo -e "  \____/\___/|_|  \___\____/ \___\__,_|_| |_| \033[0m"



###----> corescan.sh <----###

echo " "
echo "Finding core files for /home. This may take a while..."




if [ ! -d "/home/sscan/coreLogs" ]
then
mkdir /home/sscan/coreLogs
chmod 755 /home/sscan/coreLogs
fi
 
fileCoreLog="$(date +%y%m%d%H%M)_corefind.log"


ls -ld /home*/* | awk '{print $9}' > /var/log/dirs.source


#Numbers for loading bar
percent2=$(wc -l /var/log/dirs.source | awk '{print $1}')
process=$(bc -l <<< "scale = 3; 100 / $percent2")
proc2=$process

while read dirs
do

echo -ne "$process \r"
        
        find $dirs -type f -size +20M -name "core.[[:digit:]]*[[:digit:]]" >> corefind.log
 

        
        process=$(bc -l <<< "scale = 2; $process + $proc2")


done < /var/log/dirs.source


cp corefind.log /home/sscan/coreLogs/$fileCoreLog
echo "Results can be found in /home/sscan/coreLogs/"$fileCoreLog
