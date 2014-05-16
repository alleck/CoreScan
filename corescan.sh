echo -e "\033[36m   ____                _____                 "
echo "  / __ \              /  ___\                           "
echo " | /  \/ ___  _ __ ___\ \`--.  ___ __ _ _ __            "
echo " | |    / _ \| '__/ _ \\\`--. \/ __/ _\` | '_ \         "
echo " | \__/\ (_) | | |  __/\__/ / (_| (_| | | | |           "
echo -e "  \____/\___/|_|  \___\____/ \___\__,_|_| |_| \033[0m"


                                            
###----> corescan.sh <----###

echo "Finding core files for /home. This may take a while..."
find /home*/* -type f -name "core.[[:digit:]]*[[:digit:]]" >> corefind.log

cp corefind.log /home/AcctSize/coreLogs/$(date +%Y%m%d-%H%M)_corefind.log

echo "Removing the core dumps.."
while read line
do
 rm -f $line
done < corefind.log

echo "Cleaning up..."
 rm -f corefind.log
echo "Done!"
