
/*
 The game of life
 Assigining neighbors is a bit complex
 Age has been added
 Age determines the intensity of color
 
 Arturo Alviar
 1/23/2014
 */

int numCellsX = 100;
int numCellsY = 100;
float cellWidth, cellHeight;
boolean paused = true;
Cell[] cells;

void setup() {
  size(1000, 1000);
  cellWidth = (float)width / numCellsX;
  cellHeight= (float)height / numCellsY;
  noStroke();
  reset();
  frameRate(30);
}

void reset() {
  cells = new Cell[numCellsX * numCellsY];
  for (int j = 0; j < numCellsY; j++) {
    for (int i = 0; i < numCellsX; i++) {
      int index = i + j * numCellsX;
      cells[index] = new Cell(i, j);
      if ((int)random(2) == 0) {
        cells[index].nextState =true;
      }
    }
  }
  for (int j = 0; j < numCellsY; j++) {
    for (int i = 0; i < numCellsX; i++) {
      int index = i + j * numCellsX;
      int above = index - numCellsX;
      int aboveLeft = index - (numCellsX - 1);
      int aboveRight = index -(numCellsX + 1);
      int below = index + numCellsX;
      int belowLeft = index + numCellsX - 1;
      int belowRight = index + numCellsX + 1;
      int left = index -1;
      int right = index +1;
      if (above < 0) {
        above = i + (numCellsY-1) *numCellsX;
      }
      if (aboveLeft < 0 || i == 0) {
        aboveLeft = (i + (numCellsY-1) *numCellsX)-1;
      }
      if (aboveRight < 0) {
        aboveRight = (i + (numCellsY-1) *numCellsX)+1;
      }
      if (j >= numCellsY-1) {
        below = i;
        belowLeft = numCellsX - 1;
        belowRight = i + 1;
      }
      if (left < 0) {
        left = index + numCellsX -1;
      }
      if (i >= numCellsX-1) {
        right = index - (numCellsX -1);
        aboveRight = above - (numCellsX-1);
      }
      if (i >= numCellsX - 1 && j < numCellsX-1) {
        belowRight = index + 1;
      }
      if (belowLeft < 0) {
        belowLeft = below + numCellsX-1;
      }
      cells[index].addNeighbor(cells[left]);
      cells[index].addNeighbor(cells[above]);
      cells[index].addNeighbor(cells[right]);
      cells[index].addNeighbor(cells[below]);
      cells[index].addNeighbor(cells[aboveLeft]);
      cells[index].addNeighbor(cells[aboveRight]);
      cells[index].addNeighbor(cells[belowRight]);
      cells[index].addNeighbor(cells[belowLeft]);
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
  for (Cell cell:cells) {
    cell.paint();
  }
}

class Cell {
  boolean state, nextState, stillAlive;
  float x, y;
  Cell[] neighbors;
  int numNeighbors, age;

  Cell(int i, int j) {
    state = false;
    nextState = state;
    x = i * cellWidth +cellWidth/2;
    y = j * cellHeight + cellHeight/2;
    neighbors = new Cell[8];
    numNeighbors = 0;
    stillAlive = false;
    age = 0;
  }

  void addNeighbor(Cell neighbor) {
    neighbors[numNeighbors] = neighbor;
    numNeighbors++;
  }

  void update() {
    int neighborCount = 0;

    for (int i = 0; i < numNeighbors; i++) {
      if (neighbors[i].state) {
        neighborCount++;
      }
    }

    if (neighborCount < 2 || neighborCount >3) {
      nextState = false;
      stillAlive = false;
      age = 0;
    }
    if (neighborCount == 3) {
      nextState = true;
      stillAlive = true;
      age+=50;
    }
  }

  void paint() {
    state = nextState;
    if (state) {
      fill(34, age, age);
    }
    else {
      fill(234, 224, 0);
    }

    ellipse(x, y, cellWidth, cellHeight);
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
  case 's':
    saveFrame("aalviar_hw11-####.png");
    break;
  case 'p':
    paused = !paused;
    break;
  case 'r':
    paused = true;
    reset();
    break;
  }
}



