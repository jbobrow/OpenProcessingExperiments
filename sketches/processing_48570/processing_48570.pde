
//yi-ting sie
//課程練習：autonomy
//畫面中可以看見方格自行變化，並可隨滑鼠點擊而產生新的物件。運用網格自動機的原理，將加強物件的自主性，以強化物件與環境之關係。
//Sheng-Fen Nik Chien (2011), Complexity - Autonomy, 數位學習平台數位資訊創作http://moodle.ncku.edu.tw/course/view.php?id=43022

int _cellSize = 15;
Cell[][] _cellArray;
int _numX, _numY;


void setup() {
  size(400, 400);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  restart();
  frameRate(5);
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
  //background(200);
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

void mousePressed() {
  restart();
}

//=====================================================================

class Cell {
  float x, y;
  int state;
  int nextState;
  Cell[] neighbors;
  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;
    nextState=int(random(2));
    state = nextState;
    neighbors = new Cell[0];
  }
  void addNeighbor(Cell cell) {
    neighbors =
      (Cell[])append(neighbors, cell);
  }

  void addNeighbour(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void calcNextState() {
    if (state == 0) {
      int firingCount = 0;
      for (int i=0; i < neighbors.length; i++) {
        if (neighbors[i].state == 1) {
          firingCount++;
        }
      }
      if (firingCount == 2) {
        nextState = 1;
      } 
      else {
        nextState = state;
      }
    } 
    else if (state == 1) {
      nextState = 2;
    } 
    else if (state == 2) {
      nextState = 0;
    }
  }

  void drawMe() {
    state = nextState;
    stroke(255);
    if (state == 1) {
      fill(128,0,128);
    } else if (state == 2) {
      fill(255,128,9);
    } else {
      fill(255,255,240);
    }
    rect(x, y,_cellSize,_cellSize/2);
  }
}

void keyPressed() {  
  saveFrame("autonomoy004.jpg");
}


