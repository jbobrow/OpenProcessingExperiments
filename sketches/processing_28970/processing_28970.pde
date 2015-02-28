
/*
 Kamee Bentley
 16th May 2011
 ART443R
 */
// { imaginary opening code block for global variables

// global variables

// declare its name and assign a value
int xPos = 225;  // data type | variable name = value
int yPos = 225;

void setup() {  // opening code block
  size(450, 450);

  // local variables
  int stageWidth = width;
  int stageHeight = height;
  println("stageHeight is " + stageHeight);  //

  smooth();
  stroke(232, 218, 197);
  strokeWeight(5);
  noFill();
}  // closing code block

void draw() {

  background(38, 165, 153);

  xPos = 300;  // update the global variable xPos to 300
  int diameter = 60;  // create local variable for circle diameter to 60

    // loop to create each column
  for (int cols = 0; cols < 5; cols++) {
    // nested loop to create rows for each column
    for (int rows = 0; rows < 5; rows++) {
      drawTile(95 * cols, 95 * rows, diameter);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {
  noFill();
  ellipse(xPos + 27, yPos + 27, d, d); 
  noFill();
  ellipse(xPos + 47, yPos + 27, d, d);
  noFill();
  ellipse(xPos + 27, yPos + 47, d, d);
  noFill();
  ellipse(xPos + 47, yPos + 47, d, d);
  fill (165, 38, 38); // red circle
  ellipse(xPos + 37, yPos + 37, 30, 30); // red circle
}

//} imaginary closing code block for global variables


