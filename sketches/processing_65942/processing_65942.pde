
/*
Pixelated Gradient with Random Noise Pattern
 
Written by Lee Cody 10/22/2011
but this is creative commons, so distribute all you want.
*/
 
 
//------------------------  Start Variables --------------//
// Edit Below Here
 
int cols = 30;                                // Hight of Grid, how many blocks Tall
int rows = 30;                                // Width of Grid — blocks wide
 
color block1Color = color(255, 255, 255);     // Color of blocktype 1 (use RGB)
color block2Color = color(51, 102, 204);      // Color of blocktype 2
 
int blockSize = 10;                           // Size in pixels of each block
 
 
//-------------------------  End Variables ---------------//
 
 
 
// Define 2D Array of objects
Block[][] grid;
 
// Define Width and Height parameters based on user variables
int fullHeight = blockSize*cols;
int fullWidth = blockSize*rows;
 
void setup() {
  size(fullWidth, fullHeight);
  noLoop();
   
  // Puts a block in each space on the grid
  grid = new Block[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Block(i*blockSize,j*blockSize,blockSize,blockSize);
    }
  }
}
 
void draw() {
  background(255);
  // The counter variables i and j are also the column and row numbers and
  // are used as arguments to the constructor for each object in the grid.
 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Display each object
      grid[i][j].display();
    }
  }
  
}
 
// A Block object
class Block {
  // A block object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
 
  // Cell Constructor
  Block(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }
 
  void display() {
     
    stroke(200);
     
    // Checks Y corodinate of each block against a random number between 0 and fullHeight
    if(random(fullHeight) > y){
      fill(block1Color);
    } else {
      fill(block2Color);
    }
    rect(x, y,w,h);
     
  }
}
 
void mousePressed() {
  // On click, create new gradient
  redraw();
}
