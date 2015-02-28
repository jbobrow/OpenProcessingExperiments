

//Author: Liliam Rodas
//Purpose: Homework to generate my idea of DREAMS. 
// The art work is based in emergence patterns given by the application of C.A.
//Functioning: 
//Reference: previous excercises provided in class and processing.



Cell[][] _cellArray;
int _gridX, _gridY;

//SETUP OF THE PROGRAM 

void setup() {
  size(400, 400);
  smooth ();
  _gridX = floor(width/_cellSize);
  _gridY = floor(height/_cellSize);
  restart();
  //frameRate (3);
}


void restart() {
  _cellArray = new Cell[_gridX][_gridY];
  for (int x = 0; x<_gridX; x++) {
    for (int y = 0; y<_gridY; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }


  for (int x = 0; x < _gridX; x++) {
    for (int y = 0; y < _gridY; y++) {
      int above = y-1;
      int below = y+1;
      int left = x-1;
      int right = x+1;
      if (above < 0) { 
        above = _gridY-1;
      }
      if (below == _gridY) { 
        below = 0;
      }
      if (left < 0) { 
        left = _gridX-1;
      }
      if (right == _gridX) { 
        right = 0;
      }

      _cellArray[x][y].addNeighbor(_cellArray[left][above]);
      _cellArray[x][y].addNeighbor(_cellArray[left][y]);
      _cellArray[x][y].addNeighbor(_cellArray[left][below]);
      _cellArray[x][y].addNeighbor(_cellArray[x][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][y]);
      _cellArray[x][y].addNeighbor(_cellArray[right][above]);
      //_cellArray[x][y].addNeighbor(_cellArray[x][above]);
    }
  }
}


void draw() {
  noStroke();
  background (73,6,118);
  for (int x = 0; x < _gridX; x++) {
    for (int y = 0; y < _gridY; y++) {
      _cellArray[x][y].calcNextState();
    }
  }
 
  for (int x = 0; x < _gridX; x++) {
    for (int y =0; y < _gridY; y++) {
      _cellArray[y][x].drawMe();
    }
  }
}
void mousePressed() {
  restart();
}





//CREATING A CELL

int _cellSize = 4;


class Cell {

  float x, y;
  float now, before, next;

  Cell[] neighbors;

  Cell(float ex, float why) {
     x = ex * _cellSize;
    y = why * _cellSize;
    
    before =0;
    
    next= (width/random (100))+ (height/random(100));
    
    now = next;
    
    neighbors= new Cell [0];
  }
  
  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }


  void calcNextState() {
    float total = 0;
    for (int i=0; i < neighbors.length; i++) {
      total += neighbors[i].now;
    }
    float average = int(total/8);
    
    if (average == 0) {
      next = 255;
    } 
    else {
      next = now + average;
     
      if (before > 0) { 
        
        next -= before;
      }
      if (next > 255) { 
        next = 0;
      }
      else if (next < 0) { 
        next = 0;
      }
    }
    
    before = now;
  }



  void drawMe() {
     
    now = next;
    noStroke();
    
    fill (next);
    ellipse(x, y, _cellSize, _cellSize);
    
   
    
  }
}

