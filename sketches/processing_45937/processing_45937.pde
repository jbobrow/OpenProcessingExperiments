
class Cell {
  float x, y;
  float state;

  float nextState;
  float lastState =0;

  Cell[] neighbors;

  Cell(float x, float y) {
    this.x = x * cellSize;
    this.y = y * cellSize;
    nextState = 0.7;
    state = nextState;

    neighbors = new Cell[0];
  }

  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void average() {
    float total =0;
    for (int i =0; i < neighbors.length; i++) {
      total += neighbors[i].state;
    } 

    float average = int(total/9);

    if (average > 255) {
      nextState = 0;
    }
    else if (average == 0) {
      nextState = 255;
    }
    else {
      nextState = state + average;
      if (lastState > 0) {
        nextState -= lastState;
      }
      if (nextState > 255) {
        nextState = 255;
      }
      else if (nextState  <0) {
        nextState = 0;
      }
    }

    lastState = state;
  }

  void draw() {
    state = nextState;
    fill(state, nextState, 0);
    rect(x, y ,cellSize, cellSize);
  }
}


