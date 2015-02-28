
/**
 * Sorting Functions demo... 
 * 
 */

SortModule _myDomain;        // we inherit all inner classes...

String style;                // available styles DNFlag (only 3 values) | Random | Forward | Backward...
int    nmbr;                 // suitable ranges are <700 for all straight routines,
                             //                     <1800 for _shakerSort,
                             //                     <70000 for _shellSort,
                             //                     <700000 for _quickSort
String sortMethod = "";      // sorting method to deploy...

void setup() {

  size(900, 450);

  //style = "DNFlag";
  style = "Random";
  nmbr  = 700000;

  _myDomain = new SortModule();                     // we make #nmbr of babies of UserArray, in style... inherit all...

  //sortMethod  = "DNFSort";                        // only suitable for style DNFlag; it does only one run...
  //sortMethod  = "bubbleSort";
  //sortMethod  = "brickSort";
  //sortMethod  = "shakerSort";
  //sortMethod  = "selectionSort";
  //sortMethod  = "insertionSort";
  //sortMethod  = "heapSort";
  //sortMethod  = "shellSort";
  sortMethod  = "quickSortDNF";
  //sortMethod  = "quickSortSplit";

  //noLoop();                                       // in order to produce graphic results during the sort, we need to loop the sorting process in draw()
}

void draw() {                                       // we loop over the full unsorted domain; we re-use the sorting loop with diminishing sorting domain...

  if (!_myDomain._sorted()) {                       // we test, if minD == maxD...
    _myDomain._doSort();                            // deploy sorting method...
    _myDomain._view();                              // display intermediate result...
  }
  if (_myDomain._sorted() || _myDomain._sorted) {   // some routines however, need extra control...
    noLoop();
  }
}


