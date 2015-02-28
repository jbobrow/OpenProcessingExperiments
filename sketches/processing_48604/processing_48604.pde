
//author:Robertlun,ncku arch
//purpose: homework.dream
//concept:expressing feeling of dream.(Press the mouse to restart.)
//reference: from the teacher"Sheng-Fen Nik Chien."



Cell[][] _cellArray;
int _numX, _numY;
int _cellSize = 3;
 
//////////////////////// MAIN PART
 
void setup() {
  size(600, 400);
  frameRate(5);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  restart();
}
 
void restart() {
  _cellArray = new Cell[_numX][_numY];
  for (int x = 0; x<_numX; x++) {
    for (int y = 0; y<_numY; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }
 
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
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
      _cellArray[x][y].addNeighbour(_cellArray[left][above]);
      _cellArray[x][y].addNeighbour(_cellArray[left][y]);
      _cellArray[x][y].addNeighbour(_cellArray[left][below]);
      _cellArray[x][y].addNeighbour(_cellArray[x][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][y]);
      _cellArray[x][y].addNeighbour(_cellArray[right][above]);
      _cellArray[x][y].addNeighbour(_cellArray[x][above]);
    }
  }
}
 
void draw() {
  background(255);
  fill(255, 20);
  rect(0, 0, width, height);
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      _cellArray[x][y].calcNextState();
    }
  }
  translate(_cellSize/2, _cellSize/2);
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      _cellArray[x][y].drawMe();
    }
  }
}
 /////////////////mouse press effect
void mousePressed() {
  restart();
  fill(random(255),random(255),random(255), 100);

  ellipse(mouseX, mouseY,60 ,60);

}
 
/////////////// OBJECT
class Cell {
  float x, y;
  boolean state;
  boolean nextState;
  Cell[] neighbors;
  int age;
  int neighborCount;
 
  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;
    if (random(2) > 1) {
      nextState = true;
    }
    else {
      nextState = false;
    }
    state = nextState;
    age = 0;
    neighborCount = 0;
    neighbors = new Cell[0];
  }
 
  void addNeighbour(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }
 
  void calcNextState() {
 
    neighborCount = 0;
    for (int i=0; i < neighbors.length; i++) {
      if (neighbors[i].state == true) {
        neighborCount++;
      }
    }
    // RULES
    if (state == true) {  
      if ((neighborCount == 2) || (neighborCount == 3)) {
        nextState = true;
      }
      else {
        nextState = false;
      }
    }
    else {  
      if (neighborCount ==3) {
        nextState = true;
      }
      else {
        nextState = false;
      }
    }
  }
 
  void drawMe() {
    state = nextState;
    stroke(255,255,255);
    if (state == true) {
      fill(random(255),random(255),random(255), 255);
      age++;
    }
    else {
      fill(255, 255, 255,190);
      age = 0;
     //rect(x, y, _cellSize+age, _cellSize+age);

    }
 rect(x, y, _cellSize+age*5,_cellSize+age*5);

}
}


