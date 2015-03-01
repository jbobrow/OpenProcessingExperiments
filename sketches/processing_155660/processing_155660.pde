
// Conway's Game of Life - Teaching 2D Arrays

/* @pjs font="Arial.ttf"; */ 

int displayX = 400;
int displayY = 400;

int playerScale = 10; // factor to magnify grid
int cols = displayX/10; // number of cols in world
int rows = displayY/10-3; // number of rows
int[][] world = new int[cols][rows]; // initialize 2D array that will house the game

int aliveFill = 128;
int backgroundFill = 0;
int systemReset = 0;

void setup() {
  size(displayX,displayY);
  textFont(createFont("Arial",14));
  smooth();
  
  frameRate(10);
  background(0);
  translate(5,25); // shifts everything to the right and down
  
  randomizeBoard();
  
}

void draw () {
  
  title();
  translate(5,25);

  if (systemReset == 1) {
    systemReset = 0;
    randomizeBoard();
    
  }

  // check each cell
  int num; 
      
  for (int x=0; x < cols; x++) {  // loop through every column
    for (int y=0; y < rows; y++) { // loop through every row
      num = checkNeighbours(x,y);
      
      if (world[x][y] == 0 && num == 3) { // bring cell to life 
        world[x][y] = 8; // 0 = dead, 8 dead, but alive next
        drawCell(x, y, 1);
      }
      
      if ( world[x][y] == 1 && (num < 2 || num > 3) ) { // kill cell
        world[x][y] = -1; //  1 = alive, -1 = alive, but dead next round
        drawCell(x, y, 0);
      }
  
       
    }
  }
  
  // set all changing state codes (ie. -1 and 8)
  for (int x=0; x < cols; x++) {  // loop through every column
    for (int y=0; y < rows; y++) { // loop through every row
      if (world[x][y] == 8)
        world[x][y] = 1;  
      if (world[x][y] == -1)
        world[x][y] = 0;
    }
  }  
  
} // end of draw


void drawCell(int x, int y, int alive) {
  // draw a cell
  
  if (alive == 1) {
    fill(aliveFill);
    ellipse(x*playerScale, y*playerScale, 8, 8);
  } else {
    fill(backgroundFill);
    noSmooth();
    ellipse(x*playerScale, y*playerScale, 8, 8);
    smooth();
  }
}

int checkNeighbours(int x, int y) {
  // check how neighbours a position has
  int neighbours = 0;

  for (int dx=-1; dx<=1; dx++) {
    for (int dy=-1; dy<=1; dy++) { 
      if (dy==0 && dx==0) // skip checking ourselves
        continue; 
      if ((x+dx >= 0 && x+dx < cols) && (y+dy >= 0 && y+dy < rows) && (world[x+dx][y+dy] == 1 || world[x+dx][y+dy] == -1) ) {
        neighbours++;
      }
    } 
  }
  
  return neighbours; 
  
}


void randomizeBoard() {
  // randomize the game board
  for (int x=0; x < cols; x++) {  // loop through every column
    for (int y=0; y < rows; y++) { // loop through every row
     
      world[x][y] = int(random(2)); // place a 0 or 1 into the world
      if (world[x][y] == 1) {
        drawCell(x, y, 1);   // if world holds a 1 then draw a circle
      } else {
        drawCell(x, y, 0);   // if world holds a 1 then draw a circle
      }
  
    }
  }
 
}


void title() {
  fill(aliveFill);
  text("Mr.C's Game of Life", 10, 13);
  
}
