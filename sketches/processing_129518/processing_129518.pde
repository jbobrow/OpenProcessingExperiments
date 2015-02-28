
/**
 This is an implementation of the Game of Life, loosely based
 on the implementation in "Generative Art" by Matt Pearson.
 
 The biggest difference is the use of a 1D array. This also
 includes a pause function and an editor.
 
 C. Andrews
 2014-01-21
 **/

int numCellsX = 50; // the number of cells across
int numCellsY = 50; // the number of cells down

float cellWidth, cellHeight; // the size of the cells
Cell[] cells; // the array of all cells stored in row major order
boolean paused = true; // a control to pause simulation

void setup() {
  size(800, 800);

  cellWidth = (float)width / numCellsX;
  cellHeight = (float)height / numCellsY;
  // call the reset fucntion to initialize the world
  reset();
}

/**
 This function creates all of our Cells and established the
 relationship between them and their neighbors.
 **/
void reset() {
  // create the new array
  cells = new Cell[numCellsX * numCellsY];

  // we use a nested for loop so we can visit each cell based
  // on its coordinates in the grid
  for (int j = 0; j < numCellsY; j++) {
    for (int i = 0; i < numCellsX; i++) {
      // calculate the actual index in the array
      int index = i + j*numCellsX;
      // add in a new Cell to the array
      cells[index] = new Cell(i, j);

      // randomly set 1 in 4 Cells to be on
      if ((int)random(4) == 0) {
        cells[index].nextState =true;
      }


      // This adds the neighbors. Since we are doing this as we
      // are populating the array, not all neighbors are available
      // yet. So we do the three above and the one behind. Since this cell
      // are ahead of these, they will not have added this cell yet
      // either, so we do a reciprocal add, adding in both directions 
      // at once.

      // Also note that on the borders, we just ignore neighbors
      // that don't exist
      int neighborIndex;

      // upper left - one row up and one column back
      neighborIndex = index - numCellsX - 1;
      if (i - 1 >= 0 && j - 1 >= 0) {

        cells[index].addNeighbor( cells[neighborIndex]);
        cells[neighborIndex].addNeighbor(cells[index]);
      }

      // directly above
      neighborIndex++;
      if (j - 1 >= 0) {
        cells[index].addNeighbor( cells[neighborIndex]);
        cells[neighborIndex].addNeighbor(cells[index]);
      }

      // upper right
      neighborIndex++;
      if (i + 1 < numCellsX && j - 1 >= 0) {
        cells[index].addNeighbor( cells[neighborIndex]);
        cells[neighborIndex].addNeighbor(cells[index]);
      }

      // immediately behind
      neighborIndex = index - 1;
      if (i - 1 >= 0) {
        cells[index].addNeighbor( cells[neighborIndex]);
        cells[neighborIndex].addNeighbor(cells[index]);
      }
    }
  }
}

/**
 If the simulation is not paused, this updates all of the Cells.
 
 Paused or not, this then draws all of the cells. This separation
 allows us to selectively turn on and off Cells when the simulation
 is paused.
 **/
void draw() {
  background(255);

  if (! paused) {
    for (Cell cell: cells) {
      cell.update();
    }
  }

  for (Cell cell: cells) {

    cell.paint();
  }
}


/**
 This class manages all of the behavior of our cells.
 **/
class Cell {
  boolean state; // current state (true or false)
  boolean nextState; // the state we will transition to
  float x, y; // location on the canvas

  Cell[] neighbors; // an array of all neighbors
  int numNeighbors; // the number of neighbors

  /**
   The constructor.
   
   We initialize this with the grid position. It converts this to 
   an x,y position on the canvas. It also initializes the neighbor
   array and the state variables.
   **/

  Cell(int i, int j) {
    state = false; 
    nextState = false;  
    x = i*cellWidth + cellWidth/2;
    y = j*cellHeight + cellHeight/2;
    neighbors = new Cell[8];
    numNeighbors =0;
  }


  /**
   This function adds a neighbor to the array.
   **/
  void addNeighbor(Cell neighbor) {
    neighbors[numNeighbors] = neighbor;
    numNeighbors++;
  }


  /**
   The update function handles the rules. It starts by counting
   the number of neighbors that are "switched on" (have a 
   state that is set to true). It then uses this to determine
   what action it should take.
   **/
  void update() {

    // sum the turned on neighbors
    int neighborCount = 0;
    for (int i = 0; i < numNeighbors;i++) {
      if (neighbors[i].state) {
        neighborCount++;
      }
    }

    // Here are the actual rule for the Game of Life


    if (neighborCount <2 || neighborCount > 3) {
      // Rule 1: if not 2 or 3 neighbors, turn off
      nextState = false;
    }
    else if (neighborCount == 3) {
      // Rule 2: if exactly three neighbors, turn on
      nextState = true;
    }
  }

  /**
   The paint function paints the cell based on the state. 
   
   We also take this moment to update the state based on nextState.
   We wait until here to make sure all cells have calculated their
   nextState before we change state.
   **/
  void paint() {
    if (nextState) {
      fill(0);
    }
    else {
      fill(255);
    }
    state = nextState;
    ellipse(x, y, cellWidth, cellHeight);
  }
}


/**
 This handles mouse clicks. When the user clicks, it maps the
 mouse position to a cell. This then switches the state of that
 Cell.
 **/
void mouseClicked() {
  int i = (int)map(mouseX, 0, width, 0, numCellsX);
  int j = (int)map(mouseY, 0, height, 0, numCellsY);
  int index = i + j*numCellsX;

  cells[index].nextState = ! cells[index].nextState;
}

/**
 This handles the key presses.
 
 If the 'p' key is pressed this pauses the simulation.
 
 If the 'r' key is pressed all of the Cells are thrown away and
 new ones are created to replace them.
 **/
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



