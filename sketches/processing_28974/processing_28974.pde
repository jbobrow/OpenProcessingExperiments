
/*
 Kamee Bentley
 16th May 2011
 ART443R
 */
// { imaginary opening code block for global variables

// global variables

int xPos = 225;  // data type | variable name = value
int yPos = 225;

void setup() {  // opening code block
  size(450, 450);

  // local variables
  int stageWidth = width;
  int stageHeight = height;
  println("stageHeight is " + stageHeight);  //


  smooth();
  stroke(0, 0, 0);
  strokeWeight(0);
  fill(0, 0, 0);
}  // closing code block

void draw() {

  background(255, 255, 255);

  xPos = 300;  // update the global variable xPos to 300
  int diameter = 29;  // create local variable for circle diameter to 29

    // loop to create each column
  for (int cols = 0; cols < 15; cols++) {
    // nested loop to create rows for each column
    for (int rows = 0; rows < 15; rows++) {
      drawTile(32 * cols, 32 * rows, diameter);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {
  fill(0, 0, 0);
  ellipse(xPos + 25, yPos + 0, d, d);
  fill(255, 255, 255);
  ellipse(xPos + 30, yPos + 32, 70, 60);
}

//} imaginary closing code block for global variables


