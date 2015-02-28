
// based on 'Brian's Brain' ... a modified object
//w/ three states: Firing, Resting, Off
// from Pearson's Generative Art, 2011
//Cellular Automata based on John Conway's Game of Life
//Via Pearson's Chapter 7 in Generative Art.

//The Array & it's Global Variables
Cell[][] _cellArray; //establishes we will have a 2D array
int _cellSize = 5;
int _numX, _numY;

//setting up the environment
void setup() {
  size(400,400);// window size
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  frameRate(15);
  restart();
}

//it takes two passes to start
//so the cells have a static state for it's neighbors to read
void restart() {
  //this creates a grid of cells
  _cellArray = new Cell[_numX][_numY];
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }

  //this loop tells each object about it's neighbors
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {

      // gets the location to each side
      int above = y-1;
      int below = y+1;
      int left = x-1;
      int right = x+1;

      //this wraps locations at the edges of window
      if (above<0) {
        above =_numY-1;
      }
      if (below == _numY) {
        below = 0;
      }
      if (left<0) {
        left = _numX-1;
      }
      if (right==_numX) {
        right = 0;
      }

      //now... below will pass references to surrounding locations
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
  background(150);

  //below will calculate nest state first
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {
_cellArray[x][y].calcNextState();
    }
  }

  translate(_cellSize/2, _cellSize/2);
  //below will draw cells
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {
      _cellArray[x][y].drawMe();
    }
  }
}

void mousePressed() {
  restart();
}

//==============objects=======================

class Cell {
  float x, y;
  int state;
  int nextState;
  Cell[] neighbors;

  Cell(float ex, float why) {
    x = ex*_cellSize;
    y = why*_cellSize;
    nextState = int(random(2));
    state = nextState;
    neighbors = new Cell[0];
  }

  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void calcNextState() {
    if (state == 0) {
      int firingCount = 0;
      for (int i=0; i<neighbors.length; i++) {
        //counts firing neighbors
        if (neighbors[i].state == 1) {
          firingCount++;
        }
      }
      //if 2 neighbors are firing, fire too
      if (firingCount == 2) {
        nextState = 1;
      }
      //eles, don't change
      else {
        nextState = state;
      }
      //if just fired, rest
    }
    else if (state == 1) {
      nextState = 2;
    }
    //if rested, turn off
    else if (state == 2) {
      nextState = 0;
    }
  } 

  void drawMe() {
    state = nextState;
    noStroke();//
    //stroke(255);
    //frameRate(60);
    if (state == 1) {
      //fill(random(12),(0),(134));
      fill(#FAFF0A);
    }
    else if (state == 2) {
      fill(#FF0A12);
    }
    else {
      //fill(random(55), random(200), random(32));
      fill(#C5FF0A);
    }
    ellipse(x, y, _cellSize, _cellSize);
  }
}



