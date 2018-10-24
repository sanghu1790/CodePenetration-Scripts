// This program is written by Sangharatna Godboley.

// Logic is to mark all blocks which are missed.
// Copyright 2017 National University of Singapore
// See LICENSE.md for the license information.

#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/PassManager.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"

#include <set>
#include <vector>
#include <iostream>
#include <sstream>
#include <fstream>
#include <istream>
using namespace std;
#include <string>
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include "llvm-c/TargetMachine.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Constants.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm-c/BitWriter.h"
//#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/MemoryBuffer.h"
#include <iostream>   // std::cout
#include <string>     // std::string, std::to_string

#define DEBUG 0
/*
 * Main.
 */
int main(int argc, char **argv)
{


  std::string sequenceFile = "";
  if (argc < 1) {
    llvm::errs() << "Filename unspecified\n";
    return 1;
  } else {
	  sequenceFile = argv[1];
  }
  llvm::errs() << "sequenceFile:" << sequenceFile << "\n";

  llvm::LLVMContext &Context = llvm::getGlobalContext();
  llvm::SMDiagnostic Err;
  llvm::Module *M = ParseIRFile(argv[1], Err, Context);

  if (M == 0) {
    llvm::errs() << "ERROR: failed to load " << argv[0] << "\n";
    return 1;
  }
  llvm::errs() << "Benchmark:" << argv[1] << "\n";

  // Code to open a file and read the truth values for sequences created.
  int KappaValue = 0;
  int truthvalue;
  int conditionvalue[1000];
  int icmpp[1000];
  // char a;
  int i = 0, j = 0, value;
	int blockCounter = 0;
  //string line;

   //ifstream myfile(sequenceFile, ios_base::in);
    // std::fstream myfile("seq.txt", std::ios_base::in);
 /* if (myfile.is_open()) {

    while (myfile.good()) {
      myfile >> truthvalue;
      icmpp[i] = truthvalue; // Assigning the truth values from the seq.txt
                             // files in a comparison array to check the truth
                             // and false value
      i++;
    }

    myfile.close();

  } else
    cout << "Unable to open file";*/
	
  //int size_of_icmpp = i-1;
  //int icmp = 0;

	
//This logic is to get current blockNumber	
int blockNumber;
	std::fstream tmp("tmp.txt", std::ios_base::in);
if (tmp.is_open()) {

    while (tmp.good()) {
      tmp >> value;
		blockNumber = value;
    }

    tmp.close();

  } else
    cout << "Unable to open tmp file";	

/////////////////////////////////////////////////////////////
	
  llvm::GlobalVariable *kappa;
	//for (auto &F : *M) {
	for (llvm::Module::global_iterator GI = M->global_begin(), GE =
			M->global_end(); GI != GE; ++GI) {
		if (GI->getName() == "kappa") {
			if (DEBUG > 0)
				GI->dump();
			kappa = GI;
		}
	}
  //}

  
  for (auto &F : *M) {
    for (llvm::Function::iterator b = F.begin(); b != F.end(); ++b) {
    		blockCounter++;  
		if(blockCounter == blockNumber)
		  {
			llvm::IRBuilder<> IR(llvm::dyn_cast<llvm::BasicBlock>(b));
			IR.SetInsertPoint(b->getFirstInsertionPt());
			//IR.SetInsertPoint(b->getTerminator());
            llvm::LoadInst *Load = IR.CreateLoad(kappa);
            llvm::Value *Inc = IR.CreateAdd(IR.getInt32(1), Load);
            llvm::StoreInst *Store = IR.CreateStore(Inc, kappa);
		   }
	}
  }
	llvm::errs() << "The BLOCK NUmber: " << blockNumber << "\n";
	llvm::errs() << "The total blocks in program : " << blockCounter << "\n";;

  
    llvm::outs() << *M;

  return 0;
}




