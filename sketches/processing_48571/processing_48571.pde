
//yi-ting sie
//課程練習：autonomy
//畫面中可以看見方格自行變化，並可隨滑鼠點擊而產生新的物件。運用網格自動機的原理，將加強物件的自主性，以強化物件與環境之關係。
//Sheng-Fen Nik Chien (2011), Complexity - Autonomy, 數位學習平台數位資訊創作http://moodle.ncku.edu.tw/course/view.php?id=43022

int _cellSize = 5;
Cell[][] _cellArray;
int _numX, _numY;


void setup() {
  size(500, 500);
  _numX = floor(2*width/_cellSize);//
  _numY = floor(2*height/_cellSize);//
  restart();
  frameRate(10);
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
        above = _numY-20;//
      }
      if (below == _numY) { 
        below = 0;
      }
      if (left < 0) { 
        left = _numX-20;//
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
  fill(0,100,50);//
  rect(0,0,width,height);//
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
  float state, nextState, lastState;
  Cell[] neighbours;
  
  Cell(float ex, float why) {
    x = ex *2* _cellSize;//
    y = why *2* _cellSize;//
    lastState = 0;
    nextState = ((x/500)+(y/300))*10;
    state = nextState;
    neighbours = new Cell[0];
  }
  void addNeighbour(Cell cell) {
    neighbours =
      (Cell[])append(neighbours, cell);
  }

  void calcNextState() {
    float total = 255;
    for (int i=0; i < neighbours.length; i++) {
      total += neighbours[i].state;
    }
    float average = int(total/8);
    if (average == 255) {
      nextState = 0;
    } 
    else if (average == 0) {
      nextState = 255;
    } 
    else {
      nextState = state + average;
      if (lastState > 0) { 
        nextState -=
          lastState;
      }
      if (nextState > 255) { 
        nextState = 255;
      }
      else if (nextState < 0) { 
        nextState = 0;
      }
    }
    lastState = state;
  }

  void drawMe() {
    state = nextState;
    stroke(255,50,50);
    fill(state);
    ellipse(x, y,1.5* _cellSize, 1.5*_cellSize);
  }
}

void keyPressed() {  
  saveFrame("autonomoy005.jpg");
}


