
// autonomy
// example code based on Pearson (2011:130-140)
// creating 3-state CA: Brian's brain
// schien@mail.ncku.edu.tw

// =================== global variables =======
Cell[][] _cellArray;
int _cellSize = 10;
int _numX, _numY;

// =================== main program ===========
void setup() {
  frameRate(1);
  size(500, 300);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  restart();
}

void restart() {
  _cellArray = new Cell[_numX][_numY];
  // fill in the grid
  for (int x=0; x<_numX; x++) {
    for (int y=0; y<_numY; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }
  // setup neighbors
  for (int x=0; x<_numX; x++) {
    for (int y=0; y<_numY; y++) {
      int above = y-1;
      int below = y+1;
      int left = x-1;
      int right = x+1;
      if (above < 0) { 
        above = _numY-1;
      }
      if (below == _numY) { 
        below = 0;
      }
      if (left < 0) { 
        left = _numX-1;
      }
      if (right == _numX) { 
        right = 0;
      }
      _cellArray[x][y].addNeighbor(_cellArray[left][above]);
      _cellArray[x][y].addNeighbor(_cellArray[left][y]);
      _cellArray[x][y].addNeighbor(_cellArray[left][below]);
      _cellArray[x][y].addNeighbor(_cellArray[x][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][y]);
      _cellArray[x][y].addNeighbor(_cellArray[right][above]);
      _cellArray[x][y].addNeighbor(_cellArray[x][above]);
    }
  }
}

void draw() {
  background(200);
  // calculate next state
  for (int x=0; x<_numX; x++) {
    for (int y=0; y<_numY; y++) {
      _cellArray[x][y].calcNextState();
    }
  }
  translate(_cellSize/2, _cellSize/2);
  for (int x=0; x<_numX; x++) {
    for (int y=0; y<_numY; y++) {
      _cellArray[x][y].drawMe();
    }
  }
}

void mousePressed() {
  restart();
}


// =================== object =================
class Cell {
  float x, y;
  int state, nextState;  //0: off, 1: firing, 2: rest
  Cell[] neighbors;

  // constructor
  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;
    nextState = int(random(2));
    state = nextState;
    neighbors = new Cell[0];   // creating an empty array
  }

  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void calcNextState() {
    int firingCount = 0;
    for (int i=0; i<neighbors.length; i++) {
      if (neighbors[i].state == 1) {
        firingCount++;
      }
    }
    nextState = state;
    if ((state == 0) && (firingCount == 2)) { // rule 3
      nextState = 1;
    } 
    else if (state == 1) { // rule 1
      nextState = 2;
    } 
    else if (state == 2) { // rule 2
      nextState = 0;
    }
  }

  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == 1) {
      fill(0);
    } 
    else if (state == 2) {
      fill(150);
    } 
    else {
      fill(255);
    }
    ellipse(x, y, _cellSize, _cellSize);
  }
}


