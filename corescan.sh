echo "Finding core files for /home. This may take a while..."
find /home/* -name "core.*" >> corefind.log
echo "Finding core files for /home2. This may take a while..."
find /home2/* -name "core.*" >> corefind.log
echo "Finding core files for /home3. This may take a while..."
find /home3/* -name "core.*" >> corefind.log
echo "Finding core files for /home4. This may take a while..."
find /home4/* -name "core.*" >> corefind.log
echo "Finding core files for /home5. This may take a while..."
find /home5/* -name "core.*" >> corefind.log
echo "Finding core files for /home6. This may take a while..."
find /home6/* -name "core.*" >> corefind.log
echo "Finding core files for /home7. This may take a while..."
find /home7/* -name "core.*" >> corefind.log
echo "Finding core files for /home8. This may take a while..."
find /home8/* -name "core.*" >> corefind.log
echo "Finding core files for /home9. This may take a while..."
find /home9/* -name "core.*" >> corefind.log

echo "Sorting out core dumps..."
grep "core.1" corefind.log >> corerm.log
grep "core.2" corefind.log >> corerm.log
grep "core.3" corefind.log >> corerm.log
grep "core.4" corefind.log >> corerm.log
grep "core.5" corefind.log >> corerm.log
grep "core.6" corefind.log >> corerm.log
grep "core.7" corefind.log >> corerm.log
grep "core.8" corefind.log >> corerm.log
grep "core.9" corefind.log >> corerm.log

echo "Removing the core dumps.."
while read line
do

rm -f $line

done < corerm.log

echo "Cleaning up..."
rm -f corefind.log
rm -f corerm.log
echo "Done!"