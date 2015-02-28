
/**
Here is a modified version of Professor Andrew's game of life code,
with wrapping around.

Alexandre Seite
**/
int numCellsX = 30; 
int numCellsY = 30; 
float cellWidth, cellHeight; 
Cell[] cells; 
boolean paused = true;

void setup() {
  size(700, 700);
  cellWidth = (float)width / numCellsX;
  cellHeight = (float)height / numCellsY;
  reset();
}

void reset() {
  cells = new Cell[numCellsX * numCellsY];
  for (int j = 0; j < numCellsY; j++) {
    for (int i = 0; i < numCellsX; i++) {
      int index = i + j*numCellsX;
      cells[index] = new Cell(i, j);
      if ((int)random(4) == 0) {
        cells[index].nextState =true;
      }
    }
  }
  for (int j = 0; j < numCellsY; j++) {
    for (int i = 0; i < numCellsX; i++) {
      int index = i + j*numCellsX;
      if (i - 1 >= 0 && j - 1 >= 0 && i + 1 < numCellsX && j+1<numCellsY){
        cells[index].addNeighbor( cells[index-1]);
        cells[index].addNeighbor( cells[index+1]);
        cells[index].addNeighbor( cells[index-numCellsX]);
        cells[index].addNeighbor( cells[index-numCellsX-1]);
        cells[index].addNeighbor( cells[index-numCellsX+1]);
        cells[index].addNeighbor( cells[index+numCellsX]);
        cells[index].addNeighbor( cells[index+numCellsX+1]);
        cells[index].addNeighbor( cells[index+numCellsX-1]);
      }
      if (i==0 && j>0 && j+1<numCellsY){
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor(cells[index-numCellsX]);
        cells[index].addNeighbor(cells[index-numCellsX+1]);
        cells[index].addNeighbor(cells[index+1]);
        cells[index].addNeighbor(cells[index+numCellsX-1]);
        cells[index].addNeighbor(cells[index+numCellsX]);
        cells[index].addNeighbor(cells[index+numCellsX+1]);
        cells[index].addNeighbor(cells[index+2*numCellsX-1]);
      }
      if (j==0 && i>0 && i+1<numCellsX){
        cells[index].addNeighbor(cells[index+1]);
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor(cells[index+numCellsX-1]);
        cells[index].addNeighbor(cells[index+numCellsX]);
        cells[index].addNeighbor(cells[index+numCellsX+1]);
        cells[index].addNeighbor(cells[(numCellsY-1)*numCellsX+index]);
        cells[index].addNeighbor(cells[(numCellsY-1)*numCellsX+index+1]);
        cells[index].addNeighbor(cells[(numCellsY-1)*numCellsX+index-1]);
      }
      if (i==numCellsX-1 && j>0 && j+1<numCellsY){
        cells[index].addNeighbor(cells[index+1]);
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor( cells[index-numCellsX]);
        cells[index].addNeighbor( cells[index-numCellsX-1]);
        cells[index].addNeighbor(cells[index-numCellsX+1]);
        cells[index].addNeighbor(cells[index-2*numCellsX+1]);
        cells[index].addNeighbor(cells[index+numCellsX-1]);
        cells[index].addNeighbor(cells[index+numCellsX]);
      }
      if (j==numCellsY-1 && i>0 && i+1<numCellsX){
        cells[index].addNeighbor(cells[index+1]);
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor( cells[index-numCellsX]);
        cells[index].addNeighbor( cells[index-numCellsX-1]);
        cells[index].addNeighbor( cells[index-numCellsX+1]);
        cells[index].addNeighbor(cells[i-1]);
        cells[index].addNeighbor(cells[i]);
        cells[index].addNeighbor(cells[i+1]);
      }
      if (index==0){
        cells[index].addNeighbor(cells[1]);
        cells[index].addNeighbor(cells[numCellsX-1]);
        cells[index].addNeighbor(cells[numCellsX]);
        cells[index].addNeighbor(cells[numCellsX+1]);
        cells[index].addNeighbor(cells[2*numCellsX-1]);
        cells[index].addNeighbor(cells[(numCellsY-1)*numCellsX]);
        cells[index].addNeighbor(cells[(numCellsY-1)*numCellsX+1]);
        cells[index].addNeighbor(cells[(numCellsY)*numCellsX-1]);
      }
      if (index==numCellsX-1){
        cells[index].addNeighbor(cells[0]);
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor(cells[index+1]);
        cells[index].addNeighbor(cells[index+numCellsX-1]);
        cells[index].addNeighbor(cells[index+numCellsX]);
        cells[index].addNeighbor(cells[numCellsX*numCellsY-1]);
        cells[index].addNeighbor(cells[numCellsX*numCellsY-2]);
        cells[index].addNeighbor(cells[(numCellsY-1)*numCellsX]);
      }
      if (index==(numCellsY-1)*numCellsX){
        cells[index].addNeighbor(cells[0]);
        cells[index].addNeighbor(cells[1]);
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor(cells[index+1]);
        cells[index].addNeighbor(cells[numCellsX-1]);
        cells[index].addNeighbor(cells[numCellsX*numCellsY-1]);
        cells[index].addNeighbor(cells[index-numCellsX]);
        cells[index].addNeighbor(cells[index-numCellsX+1]);
      }
      if (index==numCellsX*numCellsY-1){
        cells[index].addNeighbor(cells[0]);
        cells[index].addNeighbor(cells[numCellsX-1]);
        cells[index].addNeighbor(cells[numCellsX-2]);
        cells[index].addNeighbor(cells[index-1]);
        cells[index].addNeighbor(cells[index-numCellsX]);
        cells[index].addNeighbor(cells[index-numCellsX-1]);
        cells[index].addNeighbor(cells[index-numCellsX+1]);
        cells[index].addNeighbor(cells[index-2*numCellsX+1]);
      }
    }
  }
}


void draw() {
  background(0);
  if (! paused) {
    for (Cell cell: cells) {
      cell.update();
    }
  }
  for (Cell cell: cells) {
    cell.paint();
  }
}

class Cell {
  boolean state; 
  boolean nextState; 
  float x, y; 
  Cell[] neighbors; 
  int numNeighbors;
  
  Cell(int i, int j) {
    state = false;
    nextState = false; 
    x = i*cellWidth + cellWidth/2;
    y = j*cellHeight + cellHeight/2;
    neighbors = new Cell[8];
    numNeighbors =0;
  }

  void addNeighbor(Cell neighbor) {
    neighbors[numNeighbors] = neighbor;
    numNeighbors++;
  }

  void update() {
    int neighborCount = 0;
    for (int i = 0; i < numNeighbors;i++) {
      if (neighbors[i].state) {
        neighborCount++;
      }
    }
    if (neighborCount <2 || neighborCount > 3) {
      nextState = false;
    }
    else if (neighborCount == 3) {
      // Rule 2: if exactly three neighbors, turn on
      nextState = true;
    }
  }

  void paint() {
    if (nextState) {
      fill(255);
    }
    else {
      fill(0);
    }
    state = nextState;
    noStroke();
    rectMode(CENTER);
    rect(x, y, cellWidth, cellHeight);
  }
}

void mouseClicked() {
  int i = (int)map(mouseX, 0, width, 0, numCellsX);
  int j = (int)map(mouseY, 0, height, 0, numCellsY);
  int index = i + j*numCellsX;

  cells[index].nextState = ! cells[index].nextState;
}

void keyPressed() {
  switch(key) {
  case 'p':
    paused = !paused;
    break;

  case 'r':
    paused =true;
    reset();
    break;
  }
}



