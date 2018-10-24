#!/bin/ksh
echo sanghu
export BENCHMARK=$1
export TOOL=$2
clang `llvm-config --cxxflags` -D_GLIBCXX_USE_CXX11_ABI=0 -I /usr/local/include/ -c -O0 -emit-llvm -g ${BENCHMARK}.c
llvm-dis ${BENCHMARK}.bc

#Below is the list of all coreutil programs which have been ran with some specific symbolic argument. To run a particular program with KLEE or TX, just enable the command. All commands are intentially hard coded according to their requirements.   

#The following command is to run paste.c test54.c coreutil program using KLEE and TX 
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 ${BENCHMARK}.bc --sym-args 2 4 20 --sym-args 2 6 20 --sym-files 1 20 --sym-stdin 16 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 ${BENCHMARK}.bc --sym-args 2 4 20 --sym-args 2 6 20 --sym-files 1 20 --sym-stdin 16 --sym-stdout > visitedblockNumber.txt 2>error
 
#To run echo.c test55.c in KLEE and TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 echo.bc --sym-args 100 1000 50000 --sym-files 200 10000 --sym-stdin 10000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 echo.bc --sym-args 100 1000 50000 --sym-files 200 10000 --sym-stdin 10000 --sym-stdout > visitedblockNumber.txt 2>error

#To run mknod.c test56.c in KLEE and TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 mknod.bc --sym-args 0 800 5000 --sym-args 0 3 2000 --sym-files 1 8000 --sym-stdin 80 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 mknod.bc --sym-args 0 800 5000 --sym-args 0 3 2000 --sym-files 1 8000 --sym-stdin 80 --sym-stdout > visitedblockNumber.txt 2>error

#To run od.c test57.c in KLEE and TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 od.bc --sym-args 0 3 100 --sym-files 2 100 --sym-stdin 120 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 od.bc --sym-args 0 3 100 --sym-files 2 100 --sym-stdin 120 --sym-stdout > visitedblockNumber.txt 2>error

#To run pathchk.c test58.c in KLEE and TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 pathchk.bc --sym-args 0 10 2000 --sym-args 0 10 3000 --sym-files 1 3000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 pathchk.bc --sym-args 0 10 2000 --sym-args 0 10 3000 --sym-files 1 3000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run printf.c test59.c in KLEE and TX 
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 printf.bc --sym-args 0 1000 1000 --sym-files 200 10000 --sym-stdin 10000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 printf.bc --sym-args 0 1000 1000 --sym-files 200 10000 --sym-stdin 10000 --sym-stdout > visitedblockNumber.txt 2>error

#To run cat.c test60.c in KLEE and TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 cat.bc --sym-args 0 10 100 --sym-args 0 30 100 --sym-files 10 300 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 cat.bc --sym-args 0 10 100 --sym-args 0 30 100 --sym-files 10 300 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error


#To run basename1.c test61.c in KLEE and TX basename1 is renamed to not to make conflict among the lib files and coreutils customised files
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 basename1.bc --sym-args 0 500 5000 --sym-args 0 500 2000 --sym-files 500 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 basename1.bc --sym-args 0 500 5000 --sym-args 0 500 2000 --sym-files 500 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error


#To run base64-1.c test62.c in KLEE and TX base64-1 is renamed to not to make conflict among the lib files and coreutils customised files
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 base64-1.bc --sym-args 0 10 100 --sym-args 0 20 100 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 base64-1.bc --sym-args 0 10 100 --sym-args 0 20 100 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error

#To run chcon.c test63.c in KLEE and TX 
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chcon.bc --sym-args 0 10 100 --sym-args 0 20 100 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chcon.bc --sym-args 0 10 100 --sym-args 0 20 100 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error

#To run chgrp.c test64.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chgrp.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chgrp.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run chmod.c test65.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chmod.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chmod.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run chown.c test66.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chown.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chown.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run cksum.c test67.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 cksum.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 cksum.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run comm.c test68.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 comm.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 comm.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error


#To run split.c test69.c in KLEE and TX   
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 split.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 split.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run stat.c test70.c in KLEE and TX   
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 stat.bc --sym-args 0 10 100 --sym-args 0 20 200 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 stat.bc --sym-args 0 10 100 --sym-args 0 20 200 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error


#To run stty.c test71.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 stty.bc --sym-args 0 10 100 --sym-args 0 20 200 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 stty.bc --sym-args 0 10 100 --sym-args 0 20 200 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error

#To run sum.c test72.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 sum.bc --sym-args 0 10 100 --sym-args 0 20 200 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 sum.bc --sym-args 0 10 100 --sym-args 0 20 200 --sym-files 10 100 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error

#To run sync.c test73.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 sync.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error 
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 sync.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error      

#To run tac.c test74.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 tac.bc --sym-args 0 500 5000 --sym-args 0 800 2000 --sym-files 500 2000 --sym-stdin 2000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 tac.bc --sym-args 0 500 5000 --sym-args 0 800 2000 --sym-files 500 2000 --sym-stdin 2000 --sym-stdout > visitedblockNumber.txt 2>error

#To run tee.c test75.c in KLEE and TX   
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 tee.bc --sym-args 0 100 500 --sym-args 0 80 200 --sym-files 50 200 --sym-stdin 200 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 tee.bc --sym-args 0 100 500 --sym-args 0 80 200 --sym-files 50 200 --sym-stdin 200 --sym-stdout > visitedblockNumber.txt 2>error


#----------------------------------Programs with errors start----------------------------------------
#The following command is to run dd.c coreutil program using KLEE and TX 
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 dd.bc --sym-args 0 3 10 --sym-files 1 8 --sym-stdin 8 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 dd.bc --sym-args 0 3 10 --sym-files 1 8 --sym-stdin 8 --sym-stdout > visitedblockNumber.txt 2>error

#To run dircolors.c in KLEE and TX
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=60 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 dircolors.bc --sym-args 0 30 100 --sym-files 2 200 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=60 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 dircolors.bc --sym-args 0 30 100 --sym-files 2 200 --sym-stdin 100 --sym-stdout > visitedblockNumber.txt 2>error

#To run chroot.c test67.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chroot.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 chroot.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run cp.c test69.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 cp.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 cp.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error


#To run csplit.c test69.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 csplit.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 csplit.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error


#To run date.c test69.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 date.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 date.bc --sym-args 0 100 1000 --sym-args 0 200 2000 --sym-files 100 1000 --sym-stdin 1000 --sym-stdout > visitedblockNumber.txt 2>error

#To run tail.c in KLEE and TX  
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 tail.bc --sym-args 0 500 5000 --sym-args 0 800 2000 --sym-files 500 2000 --sym-stdin 2000 --sym-stdout > visitedblockNumber.txt 2>error
#/home/sanghu/TracerX/tracerx/Release+Asserts/bin/klee --libc=uclibc --posix-runtime --max-memory=30000 --max-time=3600 -solver-backend=z3 --search=dfs --use-cex-cache --allow-external-sym-calls --environ=test.env --max-sym-array-size=4096 --max-instruction-time=30 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 tail.bc --sym-args 0 500 5000 --sym-args 0 800 2000 --sym-files 500 2000 --sym-stdin 2000 --sym-stdout > visitedblockNumber.txt 2>error

#----------------------------------Programs with errors end----------------------------------------

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

#This logic is to create FINAL file which consists of all missing block number index and executed are represented by 99999

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

mv record.dat ${BENCHMARK}-files-$TOOL/
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
