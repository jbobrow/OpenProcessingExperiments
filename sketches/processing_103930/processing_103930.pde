
int WIDTH = 600, HEIGHT = 420;

int[][][] world;
int[][]   stability;

int   squareHeight, squareWidth, numCol, numLine, density;
float stabilityFactor;
int   stabilityCount1, previousStabilityCount;
int   stabilityCount2;
color black, white;


void setup() {
  // Grid Information
  numCol       = 78;
  numLine      = 78;
  squareWidth  = WIDTH / numCol + 1;
  squareHeight = HEIGHT / numLine + 2;
  density      = 70;

  // Colors of the Grid
  black = color(0);
  white = color(255);

  world     = new int[numCol][numLine][2];
  stability = new int[numCol][numLine];
  setupGrid();
  stabilityFactor = (numCol * numLine) / 60;
  
  size(WIDTH, HEIGHT);
  background(0);

  // Gray Lines
  stroke(100, 100, 100);
  
  // To visualize it like an old machine from the 80s
  frameRate(10);
}


void setupGrid() {  
  stabilityCount1        = 0;
  stabilityCount2        = 0;
  previousStabilityCount = 0;

  for (int lines = 0; lines < numLine; lines++) {
    for (int columns = 0; columns < numCol; columns++) {
      world[columns][lines][0]  = random(101) > density ? 1 : 0;
      world[columns][lines][1]  = 0;
      stability[columns][lines] = world[columns][lines][0];
    }
  }
}


void draw() {
  background(0);

  // Draw Current State of the Grid
  for (int lines = 0; lines < numLine; lines++) {
    for (int columns = 0; columns < numCol; columns++) {
      if (world[columns][lines][0] == 1) fill(white);
      if (world[columns][lines][0] == 0) fill(black);
      rect(columns * squareWidth, lines * squareHeight, squareWidth, squareHeight);
    }
  }

  // Compute the new state of the Grid
  for (int lines = 0; lines < numLine; lines++) {
    for (int columns = 0; columns < numCol; columns++) {
      // Cell doesn't change by default
      world[columns][lines][1] = world[columns][lines][0];
      
      int count = neighbours(columns, lines);

      // Turn the square on if it was black and there are 3 neighbors now
      if (count == 3 && world[columns][lines][0] == 0) 
        world[columns][lines][1] = 1;

      // Turn the square off if it was white and there are more than 3 or less than 2 neighbors now
      if ((count < 2 || count > 3) && world[columns][lines][0] == 1)
        world[columns][lines][1] = 0;
    }
  }
    
  // Copy the new generation into the current grid
  //   and update the stability matrix
  for (int lines = 0; lines < numLine; lines++) {
    for (int columns = 0; columns < numCol; columns++) {
      world[columns][lines][0] = world[columns][lines][1];
      
      if (stability[columns][lines] != world[columns][lines][0]) {
        stability[columns][lines] = world[columns][lines][0]; 
        stabilityCount1++;
      }
    }
  }
  
  // Test if the number of cells that kept the same
  //   value is the same for a long period of time
  if (stabilityCount1 == previousStabilityCount) {
    stabilityCount2++;
    if (stabilityCount2 >= stabilityFactor) setupGrid();
  } else
    previousStabilityCount = stabilityCount1;
 
  stabilityCount1 = 0;
}


int neighbours(int x, int y) {
 return world[(x + 1) % numCol][y][0] +
        world[x][(y + 1) % numLine][0] +
        world[(x + numCol - 1) % numCol][y][0] +
        world[x][(y + numLine - 1) % numLine][0] +
        world[(x + 1) % numCol][(y + 1) % numLine][0] +
        world[(x + numCol - 1) % numCol][(y + 1) % numLine][0] +
        world[(x + numCol - 1) % numCol][(y + numLine - 1) % numLine][0] +
        world[(x + 1) % numCol][(y + numLine - 1) % numLine][0];
}
