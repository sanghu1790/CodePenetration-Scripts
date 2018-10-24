//This program is copysome1_true-unreach-call.c
#include<stdio.h>
#ifdef LLBMC
#include <llbmc.h>
#else
#include <klee/klee.h>
#endif
#include <stdlib.h>


//extern void __VERIFIER_error() __attribute__ ((__noreturn__));
void __VERIFIER_assert(int cond) { 
if(!(cond)) 
{ 
ERROR: 
printf(" "); 
} 
}
//int __VERIFIER_nondet_int();

#define N 200000

int main( ) {
  int a1[N];
  int a2[N];
  
  int i; 
  int z;
  z = 150000;
  int symb1[N];
  klee_make_symbolic(symb1, sizeof(int) * N, "symb1");
  int symb2[N];
  klee_make_symbolic(symb2, sizeof(int) * N, "symb2");
  for ( i = 0 ; i < N ; i++ ) {
         a1[i] = symb1[i];
	 a2[i] = symb2[i];
  }

  for ( i = 0 ; i < N ; i++ ) {
      if (i != z)
         a2[i] = a1[i];
  }
  
  int x;
  for ( x = 0 ; x < N ; x++ ) {
      if (x != z)
    __VERIFIER_assert(  a1[x] == a2[x]  );
  }
  return 0;
}

