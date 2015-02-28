
/**
 * Sorting Functions. 
 * 
 */

UserElem   _myElem;
UserArray  _myArray;
UserDomain _myDomain;

void setup() {

  size(900, 450);

  _myDomain = new UserDomain();

  //noLoop();                                                  // in order to produce graphic results during the sort, we need to loop the sorting process in draw()
}

void draw() {                                                  // we loop over the full unsorted domain; we re-use the sorting loop with diminishing sorting domain, over draw()...

  if (!_myDomain._sorted()) {                                  // we test, if minD == maxD...
    _myDomain._doSort();
  }
  if (_myDomain._sorted() || _myDomain._sorted) {              // some routines however, need extra control...
    noLoop();
  }
}

class UserElem {

  String _baseType = "Integer";
  int    _elem;                                                // BASETYPE
  int    h;                                                    // help storage for BASETYPE...

  UserElem(String _mode, int n, int i) { 

    if (_mode.equals("Random")) {
      _elem = int(random(n)) + 1;
    }
    if (_mode.equals("DNFlag")) {
      _elem = int(random(3)) + 1;
    }
    if (_mode.equals("Forward")) {
      _elem = i;
    }
    if (_mode.equals("Backward")) {
      _elem = n - i;
    }
  }
}

class UserArray extends UserElem {

  int minD   = 1;                     // indexbase for arrays = [minD..maxD] = [1..n]; we hate element [0], for multiple reasons now; in the future we may use it as a sentinel...
  int maxD;                           // maxD for domain-operations [minD..maxD] and algorithms
  //
  int redD   = 0;                     // set up indexbase for arrays = [minD..maxD] = [1..n]; DNF-style; this is the red portion [minD..redD]
  int whiteD = 0;                     // this is the white portion [redD+1..whiteD]
  int blueD;                          // this is the blue portion [whiteD+1..maxD]; sorted when (whiteD == blueD), minD = maxD !!!
  //
  //                                  // above domain limits are not stable; they will be changed during, and for sorting...
  //
  int minDd  = minD;                  // stable minD for view-operations, related to maxD [0+1..maxD+1]
  int maxDd;                          // stable maxD for view-operations, related to minD [0+1..maxD+1]
  //
  //  construct x, so that:   2^x  < maxD < 2^(x+1) => x*log(2) < log(maxD) < (x+1)*log(2) => x < log(maxD)/log(2) < x+1 => x > log(maxD)/log(2) - 1 => x = int(log(maxD)/log(2))
  //                          e^x  < maxD < e^(x+1) => x*ln(e)  < ln(maxD)  < (x+1)*ln(e)  => x < ln(maxD)/ln(e)   < x+1 => x > ln(maxD)/ln(e) - 1   => x = int(ln(maxD)/ln(e)) = int(ln(maxD)) = int(log(maxD)/log(2))
  //
  int x; 
  //
  //  construct inc, so that: inc = 2^x - 1
  //                      or: inc = e^x - 1 = e^(x*log(2)) - 1; x*log(2) obviously translates back to x, in logaritmus naturalis (see above)...
  //
  int inc0;
  //

  UserElem[] _localArr;               // this is our local array[0..n+1]...

  boolean _sorted  = false;           // constructing UserArray..

  int _countRun    = 0;               // we count runs...
  int _countSwap   = 0;               // we count swaps...
  int _lastSwap    = 0;               // index of last swap(): k = a || b... this depends on the sort method... go see...

  UserArray(String _mode, int n) {

    super(_mode, n, 0);               // we make babies of UserElem... inherit all...

    maxD  = n;
    maxDd = n + 1;
    blueD = n;

    x     = round(log(maxD)/log(2));             // setup for _shellSort...
    inc0  = int(exp(x*log(2))) - 1;              // we choose the Euler constant... this copes better with larger values for n

    _localArr = new UserElem[maxDd];             // at least, we always make 'something', in case maxD == 0 !

    for (int i = minD; i != maxDd; i++) {        // we fill domain[1..n+1]; element [0] stays null, for now; we may use it as a sentinel for advanced operations...
      _localArr[i] = new UserElem(_mode, n, i);  // we make babies of UserElem, style _mode ...
    }
    colorMode(HSB, n);
  } 
  //
  // comparison rules for BASETYPE int, char and all primitive types
  //
  boolean _compareEQ(int a, int b) {
    return (_localArr[a]._elem == _localArr[b]._elem);
  }
  boolean _compareGT(int a, int b) {
    return (_localArr[a]._elem > _localArr[b]._elem);
  }
  boolean _compareGE(int a, int b) {
    return (_localArr[a]._elem >= _localArr[b]._elem);
  }
  boolean _compareST(int a, int b) {
    return !_compareGE(a, b);
  }
  boolean _compareSE(int a, int b) {
    return !_compareGT(a, b);
  }
  //
  void _swap(int a, int b, int k) {
    //
    //                                                         // swap physically moves actual data of basetype... all rest of the sorting and swapping is index-based...
    //
    h                  = _localArr[a]._elem;                   // BASETYPE of _localArr[minD..maxD]...
    _localArr[a]._elem = _localArr[b]._elem; 
    _localArr[b]._elem = h;

    _lastSwap = k;                                             // k = a || b... this depends on the sort method... go see...
    _countSwap++;
  }

  void _shift(int k, int ul) {
    //
    //                                                         // shift physically moves actual data of basetype... all rest of the sorting and swapping is index-based...
    //
    h = _localArr[k]._elem;                                    // BASETYPE, mind you... eventually, we have to use swap for this...

    while (k != ul) { 
      _localArr[k]._elem = _localArr[k-1]._elem;               // this method actually moves data... this is a cyclic shift in order to place h at ul
      k--;
    }
    _localArr[k]._elem = h;                                    // why won't _localDom[j]._elem = _localDom[minD+1]._elem work ????

    _lastSwap = k;                                             // k = ul... invariant repaired... go see...
    _countSwap++;                                              // so, we count the swaps here...
  }

  void _makeHeap(int p, int q) {                               // _makeHeap() is used by _heapSort(), and formes a 'heap' out of [p..q]...

    boolean heap = false; 

    int i = p;                                                 // i = node p
    int j = 2 * i;                                             // j = left branch

    if (j > q) {
      heap = true;                                             // j outside heap to be formed: heap formed
    }
    else { 
      if ((j < q) && (_compareST(j, j+1))) { 
        j++;
      }
      heap = (_compareGE(i, j));
    }
    while (!heap) { 

      _swap(i, j, j);

      i = j;
      j = 2 * i;

      if (j > q) {
        heap = true;
      }
      else { 
        if ((j < q) && (_compareST(j, j+1))) { 
          j++;
        }
        heap = (_compareGE(i, j));
      }
    }
    if ((q%2 == 0) && (_compareST(int(q/2), q))) { 
      _swap(int(q/2), q, q);
    }
  } // end _makeHeap()

  void _partitionSortDNF(int _left, int _right) {              // _partitionSortDNF() is used by _quickSort(), and divides _localArr[_left.._right] of basetype into range [<h,=h,>h]... Dutch-National-Flag style...

    int h = _localArr[int(_left+_right)/2]._elem;              // index-driven... not data driven... but still, h = from BASETYPE, and local for recursion...

    int _red   = _left - 1;                                    // see also DNFSort...
    int _white = _left - 1;                                    //
    int _blue  = _right;                                       // this is all local for recursion...

    while (_white != _blue) {                                  // region to sort != 0

      if (_localArr[_white+1]._elem == h) {                    // =h belongs to white, extend white band...
        _white++;
      } 
      else { 
        if (_localArr[_white+1]._elem > h) {                   // >h belongs to blue, swap into blue band and extend blue band...
          _swap(_white+1, _blue, _blue); 
          _blue--;
        } 
        else { 
          _swap(_white+1, _red+1, _red+1);                     // <h belongs to red, swap into red band and extend red band...
          _white++; 
          _red++;
        }
      }
    }
    if (_red > _left) { 
      _partitionSortDNF(_left, _red);                          // sort out red... until left element== red...
    } 
    if (_blue+1 < _right) { 
      _partitionSortDNF(_blue+1, _right);                      // sort out blue... until blue+1 == right element...
    }
    _countRun++;

    _sorted = (_red == _left && _blue+1 == _right);
    //
  } // end _partitionSortDNF

  void _partitionSortSplit(int _left, int _right) {            // _partitionSortSplit() is used by _quickSort(), and divides _localArr[minD..maxD] of basetype into range [l..ll,h,ul..r]...

    int h = _localArr[int(_left+_right)/2]._elem;              // index-driven... not data driven... but still, h = from BASETYPE, and local for recursion...

    int ll = _left; 
    int ul = _right;

    while (ll <= ul) {                                         // initial: _sorted = (minD == maxD, with 1 element) = , no run... for this binary search for ul == new place for element minD+1 ...
      while (_localArr[ll]._elem < h) { 
        ll++;
      }
      while (_localArr[ul]._elem > h) { 
        ul--;
      }
      if (ll <= ul) { 
        _swap(ll, ul, ul); 
        ll++; 
        ul--;
      }
    }
    if (ul > _left) { 
      _partitionSortSplit(_left, ul);
    } 
    if (ll < _right) { 
      _partitionSortSplit(ll, _right);
    }
    _countRun++;

    _sorted = (ul == _left && ll == _right);
    //
  } // end _partitionSortSplit
}  

class UserDomain extends UserArray {                           // this is our local domain, based on UserArray[0..n+1]...

  String _sortMethod = "";                                     // sort method to deploy...
  String _baseMode   = "";

  int   x0           = 40;                                     // set up our display viewport
  int   y0           = 40;
  int   _widthVP     = width - 2*x0;
  int   _heightVP    = height - 2*y0;

  float _colWidth    = _widthVP/float(maxDd-1);
  float _colHFact    = _heightVP/float(maxDd-1);

  int   _startTime   = millis();                               // we keep time...

  UserDomain() {                                               // construct via _baseMode, and n...
    //          
    //super("DNFlag", 700);                                      // we make 700 babies of UserArray, DNF-style... inherit all...
    //super("Random", 700);                                      // we make 700 babies of UserArray, random style... suitable for all straight routines...
    //super("Random", 1800);                                     // we make 1800 babies of UserArray, random style... suitable for _shakerSort...
    //super("Random", 70000);                                    // we make 70000 babies of UserArray, random style... suitable for _shellSort...
    super("Random", 700000);                                   // we make 700000 babies of UserArray, random style... suitable for _quickSort...

    _view("display");
  }
  boolean _sorted() {
    return (minD == maxD);                                     // BOOM.... There it is: I said it for once and for all... An array is sorted when it consists of 1 element, or zero...
  }
  float _swapsPerRun() {
    return float(_countSwap)/float(_countRun);
  }

  void _doSort() {                                             // _localDom[minD..maxD] of basetype to be Sorted, of three types of elements [0,1,2], or even [<,=,>] for that matter !!!

    //_DNFSort();
    //_bubbleSort();
    //_brickSort();
    //_shakerSort();
    //_selectionSort();
    //_insertionSort();
    //_heapSort();
    //_shellSort();
    _quickSort();
    //
    _view("display");
  }

  void _DNFSort() {                                            // _localDom[minD..maxD] of basetype to be Sorted, of three types of elements [0,1,2], or even [<,=,>] for that matter !!!

    _sortMethod = "DNFSort";
    _baseMode   = "DNFlag";

    if (_localArr[whiteD+1]._elem == 2) {                      // elem belongs to white (2), extend white band... minD 'walks' to maxD...
      whiteD++;
    } 
    else { 
      if (_localArr[whiteD+1]._elem > 2) {                     // elem belongs to blue (3), swap into blue band and extend blue band... maxD 'walks' to minD...
        _swap(whiteD+1, blueD, blueD); 
        blueD--;
      } 
      else { 
        _swap(whiteD+1, redD+1, redD+1);                       // elem belongs to red (type 1), swap into red band and extend red band... minD 'walks' to maxD... and redD tags along...
        whiteD++; 
        redD++;
      }
    }
    _countRun++;

    _sorted = (whiteD == blueD);                               // the main rule...  minD == maxD... this is the mother of all sorting, plainly stated in one sort-rule...
    //
  } // end _DNFSort

  void _bubbleSort() {                                         // _localDom[minD..maxD] of basetype to be Sorted

    _sortMethod = "bubbleSort";
    _baseMode   = "Random";

    //  i = maxD; while (i != minD) { i = i - 1; j = minD; while (j != i) { j = j + 1; if (a[j-1] > a[j]) { _swap(a[j-1],a[j]); } } }; this is the basic version, without k = last index of swap

    int j     = minD;                                          // start of stack...
    _lastSwap = j;

    while (j != maxD) {                                        // j == minD == maxD == _sorted == true
      j++; 
      if (_compareGT(j-1, j)) {                                // push bigger to maxD
        _swap(j-1, j, j);                                      // swap keeps track of last swap... after that point, the array is sorted...
      }
    } 
    maxD = _lastSwap;                                          // diminish upper domain to last swap... indiginous to bubblesort... last element is sorted, and maxD 'walks' to minD...
    _countRun++;

    //_sorted = (_lastSwap == minD);                           // the bubble-rule... first element is sorted: minD == maxD... this is an important insight, and sorting rule: no sort, no glory !!!!
    //
  } // end _bubbleSort

  void _brickSort() {                                          // _localDom[minD..maxD] of basetype to be Sorted

    _sortMethod = "brickSort";
    _baseMode   = "Random";

    //  i = minD; while (i != maxD) { i = i + 1; j = maxD; while (j != i) { j = j - 1; if (a[j-1] < a[j]) { _swap(a[j-1],a[j]); } } }; this is the basic version, without k = last index of swap

    int j     = maxD;                                          // start of stack...
    _lastSwap = j;

    while (j != minD) {                                        // j == minD == maxD == _sorted == true
      j--; 
      if (_compareGT(j, j+1)) {                                // push smaller to minD
        _swap(j, j+1, j);                                      // swap keeps track of last swap... after that point, the array is sorted...
      }
    } 
    minD = _lastSwap;                                          // enlarge lower domain to last swap... indiginous to bricksort.... first element is sorted, and minD 'walks' to maxD...
    _countRun++;

    //_sorted = (_lastSwap == maxD);                           // the brick-rule... last element is sorted: minD == maxD...
    //
  } // end _brickSort

  void _shakerSort() {                                         // _localDom[minD..maxD] of basetype to be Sorted

    _sortMethod = "shakerSort";                                // shakerSort feeds brickSort wit runs of bubbleSort... brilliant, I would say... Also known as cocktailSort...
    _baseMode   = "Random";

    if (!_sorted()) {                                          // initial: _sorted = (minD == maxD), no run...
      _bubbleSort();                                           // _sorted = (minD == maxD); the bubble-rule, and the main rule... first element is sorted: minD == maxD...
    }
    if (!_sorted()) { 
      _brickSort();                                            // _sorted = (minD == maxD); the brick-rule, and the main rule...  last element is sorted: minD == maxD... this is the Mother of Sorting...
    }
  }

  void _selectionSort() {                                      // _localDom[minD..maxD] of basetype to be Sorted

    _sortMethod = "selectionSort";
    _baseMode   = "Random";

    int j     = minD;                                          // start of stack...
    _lastSwap = j;

    while (j != maxD) {                                        // initial: _sorted = (minD == maxD), no run... for this linear search for the smallest in the stack...
      j++; 
      if (_compareGT(_lastSwap, j)) { 
        _lastSwap = j;
      }
    } 
    if (_lastSwap != minD) {                                   // dangerous trick: we should not swap j with j... depending on the swap routine... we move actual data here...
      _swap(_lastSwap, minD, _lastSwap);                       // brick-swap...
    }      
    minD++;                                                    // in this routine, minD 'walks' to maxD... this is the way we pickup playing cards... picking up smallest of the the remaining stack... less swaps...
    _countRun++;

    //_sorted = (minD == maxD);                                // the main rule...  minD == maxD... this is the mother of all sorting, plainly stated in one sort-rule...
    //
  } // end _selectionSort

  void _insertionSort() {                                      // _localDom[minD..maxD] of basetype to be Sorted

    _sortMethod = "insertionSort";
    _baseMode   = "Random";

    int ll = 1;                                                // lower limit of sorted part...
    int ul = minD + 1;                                         // upper limit is next element of unsorted part... start of stack...

    while (ll != ul) {                                         // initial: _sorted = (minD == maxD, with 1 element) = , no run... for this binary search for ul == new place for element minD+1 ...
      int m = (ll + ul) / 2; 
      if (_compareGT(minD+1, m)) { 
        ll = m + 1;
      } 
      else { 
        ul = m;
      }
    } 
    if (minD+1 != ul) {                                        // dangerous trick: we should not swap ul with ul... depending on the swap routine... we move actual data here...
      _shift(minD+1, ul);                                      // put minD+1 at ul via cyclic shift, exit stage right... nothing more than an elaborate swap...
    }
    minD++;                                                    // in this routine, minD 'walks' to maxD... this is the way we pickup playing cards... picking up first one of the remaining stack, put it in place...
    _countRun++;

    //_sorted = (minD == maxD);                                // the main rule...  minD == maxD... this is the mother of all sorting, plainly stated in one sort-rule...
    //
  } // end _insertionSort

  void _heapSort() {                                           // _localDom[minD..maxD] of basetype to be sorted

    _sortMethod = "heapSort";
    _baseMode   = "Random";

    if (_countRun == 0) {                                      // initial run, form initial heap for i; we do not loop this over draw()
      for (int i = maxD/2; i >= minD; i--) { 
        _makeHeap(i, maxD);                                    // _makeHeap() is a method of class UserArray, now... like _swap()...
      } 
      _swap(minD, maxD, maxD);
      maxD--;                                                  // in this routine, maxD 'walks' to minD... bubble with a twist... or selection/insertion backwards...
      _countRun++;
    }
    _makeHeap(minD, maxD);                                     // heap formed, let's hussle...
    _swap(minD, maxD, maxD);
    maxD--;                                                    // maxD 'walks' to minD...
    _countRun++;
    //
  } // end _heapSort

  void _shellSort() {                                          // _localDom[minD..maxD] of basetype to be sorted

    _sortMethod = "shellSort";
    _baseMode   = "Random";

    int inc = int(inc0/pow(2, _countRun));                     // neat trick: since _countRun comes from each run, we get: inc = inc0 / 2^(-0) = inc0 (first run), inc = inc0 * 2^(-1) = inc0 div 2 (second run), etc.

    if (inc != 0) {                                            // what follows, is in fact some sort of _brickSort()... see the swap... so we need to find a way to incorporate _brickSort() here...

      int j     = minD;
      _lastSwap = j;

      while (j <= (maxD - inc)) { 
        boolean ok = false; 
        while (!ok) { 
          if (_compareGT(j, j+inc)) { 
            _swap(j, j+inc, j); 
            if (j > inc) { 
              j = j - inc;
            } 
            else { 
              ok = true;
            }
          } 
          else {
            ok = true;
          }
        } 
        j++;
        //_countRun++;
      }
      _countRun++;
    }
    _sorted = (inc == 0);                                      // the main rule, minD == maxD, must be in there... but where???? it works, for now...
    //
  } // end _shellSort

  void _quickSort() {                                          // _localDom[minD..maxD] of basetype to be sorted

    _sortMethod = "quickSort";
    _baseMode   = "Random";

    //_partitionSortDNF(minD, maxD);                             // _partitionSortDNF() is a method of class UserArray, now... like _swap()...
    _partitionSortSplit(minD, maxD);                           // _partitionSortSplit() is a method of class UserArray, now... like _swap()...

    _sorted = true;
    //
  } // end _quickSort

  void _view(String _mode) {

    PFont font; 
    font = createFont("Arial", 18); 
    textFont(font);
    textAlign(CENTER); 

    color c = #ffffff;

    if (_mode.equals("debug")) {
      for (int i = minDd; i != maxDd; i++) {
        print(_localArr[i]._elem + " ");
      }
      if (_lastSwap == 0) {
        println("unsorted");
      }
      if (_lastSwap > 0) {
        println("k=" + _lastSwap);
      }
    }
    if (_mode.equals("display")) {

      background(#000000);                                     // clear the display, every run
      stroke(c);
      noFill();
      //rect(x0-1, y0-1, _widthVP+2, _heightVP+2);               // draw border around plotting region

      fill(c);
      text("This is " + _sortMethod + " sorting " + (maxDd-1) + " " + _baseMode + " elements of Basetype " + _baseType, width/2, 25);

      if (_sorted() || _sorted) {
        text("Exits " + _sortMethod + " after " + _countRun + " runs over " + (maxDd-1) + "... We needed " + _swapsPerRun() + " swaps/run, and " + (millis()-_startTime) + " milliseconds", width/2, height-15);
      }
      else {
        text("Running " + _sortMethod + ": run " + _countRun + " over " + (maxDd-1) + " ... We need " + round(_swapsPerRun()) + " swaps/run fo far...", width/2, height-15);
      }

      for (int i = minDd; i != maxDd; i++) { 

        if (!_sortMethod.equals("DNFSort")) {
          h = _localArr[i]._elem;
          c = color (h, maxDd, maxDd);
        }
        else {
          h = maxDd - 1;
          switch (_localArr[i]._elem) {
          case 1: 
            c = #ff0000; 
            break;
          case 2: 
            c = #ffffff; 
            break;
          case 3: 
            c = #0000ff; 
            break;
          }
        }
        float _colHeight = h * _colHFact;

        if (i == _lastSwap) { 
          stroke(0);
        } 
        else {
          stroke(c);
        }
        fill(c);
        rect(x0+(i-1)*_colWidth, y0+_heightVP-_colHeight, _colWidth, _colHeight);
      }
    }
  }
}


