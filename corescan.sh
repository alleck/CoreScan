###----> corescan.sh <----###

echo "Finding core files for /home. This may take a while..."
# find /home/fissionc/* -name core.{0..9}* >> corefind.log
find /home/fissionc/test/ -name "core.[[:digit:]]*" >> corefind.log

cp corefind.log coreLogs/$(date +%Y%m%d-%H%M)_corefind.log

echo "Sorting out core dumps..."
# grep "core.0" corefind.log >> corerm.log
# grep "core.1" corefind.log >> corerm.log
# grep "core.2" corefind.log >> corerm.log
# grep "core.3" corefind.log >> corerm.log
# grep "core.4" corefind.log >> corerm.log
# grep "core.5" corefind.log >> corerm.log
# grep "core.6" corefind.log >> corerm.log
# grep "core.7" corefind.log >> corerm.log
# grep "core.8" corefind.log >> corerm.log
# grep "core.9" corefind.log >> corerm.log

# cp corerm.log coreLogs/$(date +%Y%m%d-%H%M)_corerm.log

echo "Removing the core dumps.."
while read line
do

 rm -f $line

done < corefind.log

echo "Cleaning up..."
 rm -f corefind.log
# rm -f corerm.log
echo "Done!"
