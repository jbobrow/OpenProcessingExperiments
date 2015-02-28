
// data type | variable name = value

int xPos = 0;
int yPos = 0;

void setup() { 

  // opening code block
  size(450, 450);

  // local variables/no clue
  int stageWidth = width;
  int stageHeight = height;
  println("stageHeight is " + stageHeight);  //

  //background/stroke/fill of shapes
  background(183, 173, 179);
  smooth();
  stroke(230, 225, 205);
  strokeWeight(.3);
  noFill();
}  // closing code block

void draw() {
  // background of document
  background(183, 173, 179);

  xPos = 0;  // redefines the global variables
  int diameter = 76;  // defines the diameter of the ellipse

  // creates each column
  for (int cols = 0; cols < 14; cols++) {
    // nested inside loop to create rows
    for (int rows = 0; rows < 14; rows++) {
      drawTile(30 * cols, 30 * rows, diameter);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {

  ellipse(xPos + 50, yPos + 50, d, d);
  ellipse(xPos + 10, yPos + 50, d, d);
  ellipse(xPos + 50, yPos + 10, d, d);
  ellipse(xPos + 10, yPos + 10, d, d);
}

