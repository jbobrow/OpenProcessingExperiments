
class Cell {
  float x;
  float y;

  boolean state;
  boolean nextState;
  float lastState;

  float ruido;

  boolean life;

  Cell[] neighbors;

  Cell(float x, float y) {
    this.x = x*cellSize;
    this.y = y*cellSize;


    if ( mag(x - cols/2, y - rows/2) < 50)
      nextState = true;
    else 
      nextState = false;

    neighbors = new Cell[0];
    state = nextState;

    ruido = random(-0.5, 0.5);
  }

  //Hacemos crecer el arreglo por un elemento
  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void average() {
  }

  void gof() {
    int countL = 0;
    for (int i =0; i < neighbors.length; i++) {
      if (neighbors[i].state == true)
        countL++;
    }

    if (life) {
      if (countL == 2 || countL ==3) {
        nextState = true;
      }
      else {
        nextState  =false;
      }
    }
    else {
      if (countL ==2)
        nextState = true;
      else
        nextState = false;
    }
  }


  void draw() {
    state = nextState;
    noStroke();
    float c =   mag(x - cols, y - rows)*1.0 + noise(noiseValue)*50;
    if (state)
      fill(0, c);//noise(ruido)*150);
    else {
      fill(255, c);
    }
    rect(x, y, cellSize, cellSize);
  }
}


