#!/bin/ksh
# This shell script is written by Sangharatna Godboley
export BENCHMARK=$1
echo $BENCHMARK
mkdir $BENCHMARK-ERROR-LIST-tx
mkdir $BENCHMARK-run-tx
mkdir llcode-$BENCHMARK
mkdir $BENCHMARK-KTEST-tx
mkdir $BENCHMARK-COV-tx

clang `llvm-config --cxxflags` -D_GLIBCXX_USE_CXX11_ABI=0 -I /usr/local/include/ -c -O0 -emit-llvm -g $BENCHMARK.c
g++ -o markcond markcond.cpp `llvm-config-3.5 --cxxflags` `llvm-config-3.5 --ldflags` `llvm-config-3.5 --libs` -lpthread -lncurses -ldl
# Below code targets for atomic conditions
llvm-dis $BENCHMARK.bc
let z=1
let m=1
let n=1
totalblocks=$(wc -l < missingblocks.txt)
((totalblocks=totalblocks-5))
while IFS= read -r line;do
    echo "$line" > tmp.txt
value1=$(< tmp.txt)
if (( $z <= $totalblocks )); then
if [ "$value1" != "99999" ] && [ "$z" == "$value1" ]  
then
./markcond $BENCHMARK.ll 2> $BENCHMARK-$z.msg 1> $BENCHMARK-$z.ll
fi
fi
((z=z+1));
done < "missingblocks.txt"

#The logic to run Tracer-x
rm *.bc
for w in `ls -v ${BENCHMARK}-*.ll`;  
do 
clang -c -emit-llvm -g $w
/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --max-memory=30000 --max-time=3600 -write-cov -solver-backend=z3 --search=dfs -exit-on-error-type=Assert ${w%.ll}.bc

for y in `find klee-last/*.assert.err -type f`;  #To get error test cases
do
echo $y 
cp ${y%.assert.err}.* klee-new 
done

echo $w >  "$BENCHMARK-ERROR-LIST-tx/$(basename $w)"
sed -n '/Error: ASSERTION FAIL: kappa violation /p' klee-new/test******.assert.err >> $BENCHMARK-ERROR-LIST-tx/$(basename $w)
echo '()' >>  "$BENCHMARK-ERROR-LIST-tx/$(basename $w)"


/home/sanghu/TracerX/tracerx/Release+Asserts/bin/ktest-tool klee-new/test******.ktest > "$BENCHMARK-run-tx/$(basename $w)"
echo '()' >>  "$BENCHMARK-run-tx/$(basename $w)"


mv $w llcode-$BENCHMARK/


for file in klee-new/test******.ktest
do
  mv "$file" $BENCHMARK-KTEST-tx/test${m}.ktest
  ((m = m + 1))
done

for file1 in klee-new/test******.cov
do
  mv "$file1" $BENCHMARK-COV-tx/test${n}.cov
  mv $BENCHMARK-COV-tx/test${n}.cov $BENCHMARK-COV-tx/$(basename $w)
  ((n = n + 1))
done

rm klee-new/*.*
done

for y in `ls -v $BENCHMARK-ERROR-LIST-tx/${BENCHMARK}-*.ll`;   
do 
 
     cat $y >> $BENCHMARK-ERROR-LIST-tx/FOUND-SEQUENCES-$BENCHMARK.txt

done

for x in `ls -v $BENCHMARK-run-tx/${BENCHMARK}-*.ll`; 
do 
 
     cat $x >> $BENCHMARK-run-tx/TESTSUITE-$BENCHMARK.txt
done
./info.sh $BENCHMARK

