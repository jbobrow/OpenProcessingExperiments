


// Inputs 

void keyPressed() {
  if (key == CODED) {
    // CODED ------------------------------------------------
    EvluateCodedKeys();
  } 
  else {
    // not Coded --------------------------------------
    EvluateNotCodedKeys();
  } // else
} // func 

// ==============================================================

void EvluateCodedKeys () {
  // coded
  if (keyCode == UP) {
    // move selection up
    done=false; 

    int i2 = getSelectedNode () ;
    //myTree[i].boolIsSelected = false;

    int i = getNumberOfSelectedNodeInTree(); 
    increaseSelectedNodeForMinus ( i - 1 ) ;

    myTree[i2].boolIsSelected = false;

    // if not done, it's at the beginning
    if (!done) {
      // at the beginning: go to End
      increaseSelectedNode ( maxNumber-2 ) ;
    }
  } //  
  else if (keyCode == DOWN) {
    // move selection down
    done=false; 
    int i = getNumberOfSelectedNodeInTree(); 
    print(i);
    increaseSelectedNode ( i + 1 ) ;
    // if not done 
    if (!done) {
      // at the end: jump to the beginning
      increaseSelectedNode ( 0 ) ;
    }
    i = getNumberOfSelectedNodeInTree();
    println("---" + i);
    // myTree[i].boolIsSelected = false;
  } // 
  else 
  {
    // do nothing
  } // else
}

// ------------------------------------------------

void EvluateNotCodedKeys () {

  if (key == '+') {
    // extend branch 
    // println ("+");
    int i = getSelectedNode (); 
    myTree[i].boolIsOpen = true; // open node
  } 
  else if (key == '-') {
    // hide branch
    // println ("-");
    int i = getSelectedNode (); 
    myTree[i].boolIsOpen = false;
  }
  else if (key == 'f') {
    // flat text or not 
    boolShowAllTextAsFlatText=!boolShowAllTextAsFlatText;
  }
  else if (key == '0') { 
    // ZERO
    int i = getSelectedNode () ;     
    myTree[i].boolIsSelected=false;
    myTree[0].boolIsSelected=true;    
    // increaseSelectedNode ( 0 ) ;
  }
  else {
    // do nothing
  } // else
} // func 


