echo sanghu
export BENCHMARK=$1
echo $BENCHMARK
echo "**********Deleting files started**"
mkdir $BENCHMARK-results

rm -r klee-out-*
mv llcode-$BENCHMARK $BENCHMARK-results
mv $BENCHMARK-ERROR-LIST-tx $BENCHMARK-results

mv $BENCHMARK-KTEST-tx $BENCHMARK-results
mv $BENCHMARK-COV-tx $BENCHMARK-results

mv $BENCHMARK-run-tx $BENCHMARK-results
mv maininfo.txt $BENCHMARK-results
mv maininfo1.txt $BENCHMARK-results
mv timeTx-$BENCHMARK.txt $BENCHMARK-results


mv info $BENCHMARK-results

cp missingblocks.txt $BENCHMARK-results
rm *.bc
rm *.ll
rm *.msg
echo "**********Deleting files end******"
