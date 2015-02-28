
// global variables
// declared its name and assigns a value
// x Position
int xPos = 225;
// y Position
int yPos = 225;

void setup() {
  // size of screen
  size(450, 450);
  // local variables
  // stops animation
  noLoop();
  // another way of adding width and height to the stage
  int stageWidth = width;
  int stageHeight = height;
  // background's color in RGB
  background(115, 206, 245);
  // smooths out objects
  smooth();
  //minus the fill
  noFill();
}

void draw() {
  // Locally changing the xPosition within the draw method
  // integers a creating size of ellipses
  int f = 55;

  // e = columns (across)
  for ( int e = 0; e < 15; e++) {
    // t = rows (down)
    for (int t = 0; t < 13; t++) {
      // drawing diamonds
      drawCenters(49 * e, 49 * t, f);
    }
  }
}
void drawCenters(int xPos, int yPos, int f) {
  fill(255, 255, 255, 75);
  noStroke();
  smooth();
  // placing registration point in the center
  rectMode(CENTER);
  // saves the matrix at the top of the stack
  pushMatrix();
  // transforming the matrix using the x and y positions
  translate(45, 45);
  // rotating rectangle
  rotate(0.771+PI/180);
  // retransforming the matrix
  translate(-50, -50);
  rect(xPos, yPos -250, f, f); 
  // restores the previous coordinate system
  popMatrix();
}



