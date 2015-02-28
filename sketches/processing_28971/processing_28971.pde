
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
  strokeWeight(17);
  fill(0, 160, 198);
}  // closing code block

void draw() {

  background(239, 230, 216);

  xPos = 300;  // update the global variable xPos to 300
  int diameter = 55;  // create local variable for circle diameter to 55

    // loop to create each column
  for (int cols = 0; cols < 5; cols++) {
    // nested loop to create rows for each column
    for (int rows = 0; rows < 5; rows++) {
      drawTile(90 * cols, 90 * rows, diameter);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {
  rect(xPos + 17, yPos + 17, d, d);
}

//} imaginary closing code block for global variables


