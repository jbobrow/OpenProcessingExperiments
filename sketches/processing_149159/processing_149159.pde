
int CELL_DIMENSION = 10;
int TOTAL_CELLS;
int ID_ITERATOR = 0;
int INITIAL_DIVISOR = 10;
int HIST_SCALE = 100;
int counts[] = new int[9];
ArrayList<Cell> cells = new ArrayList<Cell>();

void setup() {
  size(1000, 600);
  TOTAL_CELLS = (width/CELL_DIMENSION)*(height/CELL_DIMENSION);
  background(0);
  frameRate(60);
  noStroke();
  fill(255, 0, 0);
  rectMode(CENTER);
  for (int i = 0; i < height/CELL_DIMENSION; i++) {
    for (int j = 0; j < width/CELL_DIMENSION; j++) {
      cells.add(new Cell(j, i, 0, ID_ITERATOR));
      ID_ITERATOR++;
    }
  }
  cells.add(new Cell(-1, -1, 0, ID_ITERATOR));
  for (int i = 0; i < TOTAL_CELLS; i++) {
    int randomLife = floor(random(TOTAL_CELLS));
    if (randomLife < TOTAL_CELLS/INITIAL_DIVISOR) {
      cells.get(i).live();
      cells.get(i).drawCell();
    }
  }
}

void draw() {
  background(0);
  //drawGrid();
  for (int i = 0; i < TOTAL_CELLS; i++) {
    cells.get(i).colorCell();
    cells.get(i).drawCell();
  }
  for (int i = 0; i < TOTAL_CELLS; i++) {
    cells.get(i).updateNeighbors();
    cells.get(i).updateLife();
    cells.get(i).updateHist();
  }
  drawHist();
}
class Cell {
  int XID, YID, life, ID, neighbors;

  Cell(int _XID, int _YID, int _life, int _ID) {
    XID = _XID;
    YID = _YID;
    life = _life;
    ID = _ID;
    neighbors = 0;
  }

  int getX() {
    return XID;
  }
  int getY() {
    return YID;
  }
  int getID() {
    return ID;
  }
  int getLife() {
    return life;
  }
  void kill() {
    life = 0;
  }
  void live() {
    life = 1;
  }
  void updateLife() {
    if (life == 1 && (neighbors < 2 || neighbors > 3)) {
      life = 0;
    } 
    else if (life == 0 && neighbors == 3) {
      life = 1;
    }
  }
  int getNeighbors() {
    return neighbors;
  }
  void updateNeighbors() {
    neighbors = cells.get(findCell(XID-1, YID-1)).getLife() + 
      cells.get(findCell(XID, YID-1)).getLife() + 
      cells.get(findCell(XID+1, YID-1)).getLife() + 
      cells.get(findCell(XID-1, YID+1)).getLife() + 
      cells.get(findCell(XID, YID+1)).getLife() + 
      cells.get(findCell(XID+1, YID+1)).getLife() + 
      cells.get(findCell(XID-1, YID)).getLife() + 
      cells.get(findCell(XID+1, YID)).getLife();
  }
  void colorCell() {
    if (neighbors < 2) {
      fill(0, 0, 255);
    } 
    else if (neighbors == 2) {
      fill(125, 125, 255);
    } 
    else {
      fill(255, 125, 255);
    }
  }
  void drawCell() {
    if (life == 1) {
      rect(XID*CELL_DIMENSION+CELL_DIMENSION/2, YID*CELL_DIMENSION+CELL_DIMENSION/2, CELL_DIMENSION, CELL_DIMENSION);
    }
  }
  void updateHist() {
    counts[neighbors]++;
  }
}

void drawGrid() {
  for (int i = 1; i < width/CELL_DIMENSION; i++) {
    line(i*CELL_DIMENSION, 0, i*CELL_DIMENSION, height);
  }
  for (int i = 1; i < height/CELL_DIMENSION; i++) {
    line(0, i*CELL_DIMENSION, width, i*CELL_DIMENSION);
  }
}

void drawHist() {
  int histSum = 0;
  for (int i = 0; i < counts.length; i++) {
    histSum += counts[i];
  }
  fill(255);
  rect(width/5, height/5, width/CELL_DIMENSION*3, height/CELL_DIMENSION*3);
  fill(255, 0, 0);
  for (int i = 0; i < counts.length; i++) {
    rect(width/CELL_DIMENSION + CELL_DIMENSION*2*i, height/5, CELL_DIMENSION, HIST_SCALE*counts[i]/histSum);
    if (frameCount % 100 == 0) {
      println(i + "s: " + HIST_SCALE*counts[i]/histSum + "%");
    }
  }
}

void mousePressed() {
  for (int i = 0; i < TOTAL_CELLS; i++) {
    if (abs(mouseX - (cells.get(i).getX())*CELL_DIMENSION-CELL_DIMENSION/2) <= CELL_DIMENSION/2 && 
      abs(mouseY - (cells.get(i).getY())*CELL_DIMENSION-CELL_DIMENSION/2) <= CELL_DIMENSION/2) {
      cells.get(i).live();
      cells.get(i).drawCell();
    }
  }
}

int findCell(int x, int y) {
  int ID = ID_ITERATOR;
  for (int i = 0; i < TOTAL_CELLS; i++) {
    if (cells.get(i).getX() == x && cells.get(i).getY() == y) {
      ID = cells.get(i).getID();
    }
  };
  return ID;
}


