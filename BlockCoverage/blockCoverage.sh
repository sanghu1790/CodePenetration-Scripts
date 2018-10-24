#!/bin/ksh
#This shell script is written by Sangharatna Godboley
echo sanghu
export BENCHMARK=$1
export TOOL=$2
clang `llvm-config --cxxflags` -D_GLIBCXX_USE_CXX11_ABI=0 -I /usr/local/include/ -c -O0 -emit-llvm -g ${BENCHMARK}.c
llvm-dis ${BENCHMARK}.bc  
#Enable the below command to run this shell script with KLEE
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee -dump-states-on-halt=0 --max-memory=30000 --max-time=3600 -allow-external-sym-calls -exit-on-error-type=Assert --watchdog ${BENCHMARK}.bc  > visitedblockNumber.txt 2>error
#Enable the below command to run this shell script with TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee -dump-states-on-halt=0 --max-memory=30000 --max-time=3600 -allow-external-sym-calls -solver-backend=z3 --search=dfs -exit-on-error-type=Assert --watchdog ${BENCHMARK}.bc > visitedblockNumber.txt 2>error

#The following logic is to dump all basic blocks
sed '0,/All Blocks Start/d' error > allblocktemp1.txt
sed '/All Blocks End/q' allblocktemp1.txt > allblocktemp2.txt
sed '/All Blocks End/d' allblocktemp2.txt > allblocktemp3.txt
sed '/BlockScopeStarts:/{n;:l N;/BlockScopeEnds:/b; s/\n//; bl}' allblocktemp3.txt > allblocktemp4.txt
sed -e '/BlockScopeStarts:\|BlockScopeEnds:/d' allblocktemp4.txt > allblocktemp5.txt
sed -e '/Function:klee_range\|Function:klee_div_zero_check\|Function:klee_int\|Function:klee_overshift_check\|Function:memcpy\|Function:memmove\|Function:mempcpy\|Function:memset/d' allblocktemp5.txt > allblocktemp6.txt
sed 's/^.*\(Function:.*\).*$/\1/' allblocktemp6.txt > allblocksmerge.txt

#The following logic is to dump all visited basic blocks
sed '0,/Visited Blocks Starts/d' error > visitedblocktemp1.txt
sed '/Visited Blocks Ends/q' visitedblocktemp1.txt > visitedblocktemp2.txt
sed '/Visited Blocks Ends/d' visitedblocktemp2.txt > visitedblocktemp3.txt
sed '/BlockScopeStarts:/{n;:l N;/BlockScopeEnds:/b; s/\n//; bl}' visitedblocktemp3.txt > visitedblocktemp4.txt
sed -e '/BlockScopeStarts:\|BlockScopeEnds:/d' visitedblocktemp4.txt > visitedblocktemp5.txt
sed -e '/Function:klee_range\|Function:klee_div_zero_check\|Function:klee_int\|Function:klee_overshift_check\|Function:memcpy\|Function:memmove\|Function:mempcpy\|Function:memset/d' visitedblocktemp5.txt > visitedblocksmerge.txt


#This logic is to find the missing blocks
awk 'NR==FNR{Arr[$0]++;next}!($0 in Arr){print FNR}' visitedblocksmerge.txt allblocksmerge.txt > blockcounter.txt

#This logic is to create FINAL file which consists of all missing block number index and executed blocks are represented by 99999

totalblocks=$(wc -l < allblocksmerge.txt)
for i in `seq $totalblocks`
do  
echo "$i" >> check.txt
done

diff -y blockcounter.txt check.txt > cmp.txt
sed "s/							      >.*/99999/g" cmp.txt > cmp1.txt
sed 's/^[^0-9]*\([0-9]\+\).*$/\1/' cmp1.txt > FINALmissingblocks.txt

value1=$(wc -l < allblocksmerge.txt)
value2=$(wc -l < visitedblocksmerge.txt)
value3=$(wc -l < blockcounter.txt)
z=$(bc <<<"scale=2;${value2}/${value1} * 100")

#Below is for report analysis
echo "*************************************Total All Basic Blocks at least once = $value1 *********************************"
echo "*************************************Total All Basic Blocks at least once = $value1 *********************************" >> ${BENCHMARK}-report.txt

echo "*************************************Total Visited Basic Blocks in program = $value2 *********************************"
echo "*************************************Total Visited Basic Blocks in program = $value2 *********************************" >> ${BENCHMARK}-report.txt

echo "*************************************Total Missing Basic Blocks in program = $value3 *********************************"
echo "*************************************Total Missing Blocks in program = $value3 *********************************" >> ${BENCHMARK}-report.txt

echo "*************************************The Block coverage of program ${BENCHMARK}.c is ${z}'%'*********************************"
echo "*************************************The Block coverage of program ${BENCHMARK}.c is ${z} '%'*********************************" >> ${BENCHMARK}-report.txt

#The below logic is to avoid the redundant information recorded during each state execution
uniq LogBlockCoverage.txt > LogBlockCoverageUnique.txt
sort -ug -k2,2 -k1,1  record.dat > record1.dat


#The below sequence of commands for storing importants files as results and delete all non-essential files and folders
mkdir ${BENCHMARK}-files-$TOOL

cd klee-out-0
cp info ../
cp assembly.ll ../
cd ..
rm -r klee-out-0 

rm LogBlockCoverage.txt
mv LogBlockCoverageUnique.txt ${BENCHMARK}-files-$TOOL/

rm allblocktemp1.txt
rm allblocktemp2.txt
mv allblocktemp3.txt ${BENCHMARK}-files-$TOOL/
rm allblocktemp4.txt
rm allblocktemp5.txt
rm allblocktemp6.txt
mv allblocksmerge.txt ${BENCHMARK}-files-$TOOL/

rm visitedblocktemp1.txt
rm visitedblocktemp2.txt
mv visitedblocktemp3.txt ${BENCHMARK}-files-$TOOL/
rm visitedblocktemp4.txt
rm visitedblocktemp5.txt
mv visitedblocksmerge.txt ${BENCHMARK}-files-$TOOL/
mv blockcounter.txt ${BENCHMARK}-files-$TOOL/


rm check.txt
rm cmp.txt
rm cmp1.txt
mv FINALmissingblocks.txt ${BENCHMARK}-files-$TOOL/

rm record.dat
mv record1.dat ${BENCHMARK}-files-$TOOL/

mv ${BENCHMARK}.c ${BENCHMARK}-files-$TOOL/
mv ${BENCHMARK}.bc ${BENCHMARK}-files-$TOOL/
mv ${BENCHMARK}.ll ${BENCHMARK}-files-$TOOL/
mv visitedblockNumber.txt ${BENCHMARK}-files-$TOOL/
mv Livecoverage.txt ${BENCHMARK}-files-$TOOL/

mv error ${BENCHMARK}-files-$TOOL/
mv info ${BENCHMARK}-files-$TOOL/
mv assembly.ll ${BENCHMARK}-files-$TOOL/
mv ${BENCHMARK}-report.txt ${BENCHMARK}-files-$TOOL/

#========================================================The End===============================================================
