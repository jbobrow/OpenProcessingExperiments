
/////////////////////////////////////////////////////////////////////

// Cellular Automata (Gerard Vichniac Voting Rule).
// class based on Matt Pearson's code as seen on the book
// "Generative Art", and modified by Luiz Zanotello
// to add different cultures inside of macro-cells.

//-------------------------------------------------------------- Cell

class Cell {
  //State
  float x, y;
  boolean state;
  boolean nextState;
  Cell[] neighbors;
  int liveCount;

  //Culture
  int nextCulture;
  int culture;
  int[] cultureCount;
  int[] convert= {};

  Cell(float wX, float wY) {
    x = wX * cellSize;
    y = wY * cellSize;
    if (random(2)>1) {
      nextState = false;
    }
    else {
      nextState = true;
    }
    state = nextState;
    nextCulture = floor(random(numCulture));
    neighbors = new Cell[0];
    liveCount = 0;
  }

  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }

  void calcNextState() {
    cultureCount = new int[numCulture];
    liveCount = 0;
    if (state==false) {
      liveCount++;
    }
    for (int i=0;i<neighbors.length;i++) {
      cultureCount[neighbors[i].culture] = cultureCount[neighbors[i].culture]+1;
      if (neighbors[i].state==false) {
        liveCount++;
      }
    }
    
    //New state
    if (liveCount<=4) {
      nextState=true;
    }
    else if (liveCount>4) {
      nextState = false;
    }
    if ((liveCount==4)||(liveCount==5)) {
      nextState=!nextState;
    }

    //New culture
    if (cultureCount[culture]<=3) {
      //Change culture
      nextCulture = floor(random(numCulture));
      while (nextCulture==culture) {
        nextCulture = floor(random(numCulture));
      }
    }
    else {
      //Small chance of changing culture
      if (99<random(100)) {
        nextCulture = floor(random(numCulture));
        while (nextCulture==culture) {
          nextCulture = floor(random(numCulture));
        }
      }
    }

    //Convert others to culture
    if (cultureCount[culture]==4&&liveCount>=4) {
      
      //Convert 1 random neighbor
      for (int i=0;i<neighbors.length;i++) {
        if (neighbors[i].culture!=culture) {
          convert = append(convert, i);
        }
      }
      int rnda = floor(random(convert.length));
      neighbors[convert[rnda]].nextCulture = culture;
      
      //Control selected neighbor state according to population
      if (random(1.4)>cellMod) {
        neighbors[convert[rnda]].nextState=true;
      }
      else {
        neighbors[convert[rnda]].nextState=false;
      }
    }
  }

  void drawMe() {
    state = nextState;
    culture = nextCulture;
    if (state==false) {
      fill(colors[colors.length-1][0], colors[colors.length-1][1], colors[colors.length-1][2]);
    }
    else {
      if (culture>(colors.length-1)){
        fill(colors[0][0], colors[0][1], colors[0][2]);
      }else{
       fill(colors[culture][0], colors[culture][1], colors[culture][2]);
      }
    }
    strokeWeight(0.5);
    stroke(colors[colors.length-1][0], colors[colors.length-1][1], colors[colors.length-1][2]);
    rect(x, y, cellSize, cellSize);
  }
}

/////////////////////////////////////////////////////////////////////
//------------------------------------------------- Restart automaton

void restart() {
  CELLS = new Cell[numX][numY];
  cellCount = 0;

  for (int x = 0; x<numX;x++) {
    for (int y=0;y<numY;y++) {
      Cell newCell = new Cell(x, y);
      CELLS[x][y] = newCell;
      cellCount++;
    }
  }
  
  minCells = floor(minCellsPer*cellCount);
  maxCells = floor((1-minCellsPer)*cellCount);

  for (int x=0;x<numX;x++) {
    for (int y=0;y<numY;y++) {
      
      //Set neighbors in thoroidal space
      int above = y-1;
      int below =y+1;
      int left = x-1;
      int right = x+1;
      if (above<0) {
        above = numY-1;
      }
      if (below==numY) {
        below = 0;
      }
      if (left<0) {
        left = numX-1;
      }
      if (right==numX) {
        right = 0;
      }
      CELLS[x][y].addNeighbor(CELLS[left][above]);
      CELLS[x][y].addNeighbor(CELLS[left][y]);
      CELLS[x][y].addNeighbor(CELLS[left][below]);
      CELLS[x][y].addNeighbor(CELLS[x][below]);
      CELLS[x][y].addNeighbor(CELLS[right][below]);
      CELLS[x][y].addNeighbor(CELLS[right][y]);
      CELLS[x][y].addNeighbor(CELLS[right][above]);
      CELLS[x][y].addNeighbor(CELLS[x][above]);

      //Set random initial culture
      CELLS[x][y].culture = floor(random(numCulture));
    }
  }
}

