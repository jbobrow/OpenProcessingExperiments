
/**
 This is an implementation of the Wave CA from 
 "Generative Art" by Matt Pearson.
 
 This actually has only a few modifications from the Game of Life.
 
 The biggest is the that the state is now a continuous value 
 between 0 and 255.
 
 C. Andrews
 2014-01-21
 **/

int numCellsX = 200; // the number of cells across
int numCellsY = 200; // the number of cells down

float cellWidth, cellHeight; // the size of the cells
Cell[] cells; // the array of all cells stored in row major order
boolean paused = true; // a control to pause simulation

void setup() {
  size(800, 800);
  noStroke();
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


/**
 This class manages all of the behavior of our cells.
 
 This is where most of the changes to make this ripples happen.
 
 Our notion of state changes to be a continuous float value.
 We also add in a lastState variable to keep track of where we came from.
 
 **/
class Cell {
  float state; // current state
  float nextState; // the state we will transition to
  float lastState; // the last state
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

    x = i*cellWidth + cellWidth/2;
    y = j*cellHeight + cellHeight/2;

    nextState = ((x/500) + (y/300)) * 14;
    state = nextState; 
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
   This has the same basic functionality -- look at the 
   neighboring states and calculate a new one.
   
   The difference here is that we are calculating the average of
   the neighbor states.
   **/
  void update() {

    // average the neighboring states
    float total = 0;

    for (int i = 0; i < numNeighbors; i++) {
      total += neighbors[i].state;
    }

    float average = int(total/numNeighbors);



    if (average == 255) {
      // If everyone is full on, turn off
      nextState = 0;
    }
    else if (average == 0) {
      // if everyone is full off, turn on
      nextState = 255;
    } 
    else {
      // otherwise add the average to the current state
      // capping at 255, and subtracting out the lastState
      // if it is non-zero
      nextState = state + average;
      if (lastState > 0) {
        nextState -= lastState;
      } 
      nextState = constrain(nextState, 0, 255);
    }
    lastState = state;
  }

  /**
   The paint function paints the cell based on the state. 
   
   Since the state is a number between 0 and 255, we use
   it for the fill color directly.
   **/
  void paint() {
    state = nextState;
    fill(state);
    rect(x, y, cellWidth, cellHeight);
  }
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



