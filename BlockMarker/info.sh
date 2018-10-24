#!/bin/ksh
export BENCHMARK=$1
mkdir info
let s=1
for x in `ls -v klee-out-*/info`; 
do  
    cp $x info/info$s
    grep "Acutual time:" $x >> maininfo.txt
    ((s =s+1));
done
sed 's/Acutual time: //g' maininfo.txt > maininfo1.txt
Total_Search_time=$(grep . maininfo1.txt | paste -sd+ | bc)
echo "Total time for Searching Sequences: " ${Total_Search_time}
echo "Total time for Searching Sequences: " ${Total_Search_time} >> timeTx-$BENCHMARK.txt
echo "****************Time Analysis Report - End**************************"
echo "****************Time Analysis Report - End**************************" >> timeTx-$BENCHMARK.txt

