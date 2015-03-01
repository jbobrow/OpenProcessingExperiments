
class Cell {
  float x, y;
  float state;      
  float lastState = 0; 
  Cell[] neighbours;

  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;
    state = lastState;
    neighbours = new Cell[0];
  }

  void addNeighbour(Cell cell) {
    neighbours = (Cell[])append(neighbours, cell);
  }  

  void calcCellState(int x) {
    float total = 0;
    if (x<_numX/2) {
      for (int i=0; i < neighbours.length; i++) {
        if (i==1) {
          total += neighbours[i].lastState*_horVelo;
        }
        else {
          total += neighbours[i].lastState;
        }
      }
    }
    else {
      for (int i=0; i < neighbours.length; i++) {
        if (i==5) {
          total += neighbours[i].lastState*_horVelo;
        }
        else {
          total += neighbours[i].lastState;
        }
      }
    }
    float average = int(total/(8+_horVelo)-_decay);
    if (average >255) {
      average = 255;
    }
    state = average;
  }

  void drawMe() {
    lastState = state;
    noStroke();
    fill(_hue,255,150,255-state*0.9);
    ellipse(x, y, _cellSize/5+state*_sensitivity, _cellSize/5+state*_sensitivity);
  }
}


