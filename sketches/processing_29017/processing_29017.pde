
// global variables
// integer (asign it and declare it)
// declare its name and assign a value
// x and y positions
int xPos = 225;
int yPos = 225;

void setup() {
  // size of screen
  size(460, 460);
  // local variables
  // stops animation
  noLoop();
  // another way of adding width and height to the stage
  int stageWidth = width;
  int stageHeight = height;
  // background's color in RGB
  background(110, 196, 151);
  // smooths out objects
  smooth();
  // adds color to stroke
  stroke(239, 225, 196);
  // adds weight to stroke
  strokeWeight(1.25);
  // minus the fill
  noFill();
}

void draw() {
  // locally changing the x Postion within the draw method
  xPos = 300;
  // integers a, b, and f using the number for size
  int a = 40;
  int b = 11;
  int f = 11;

  // c = columns (across)
  for (int c = 0; c < 9; c++) {
    // r = rows (down)
    for (int r = 0; r < 9; r++) {
      // drawing main ellipses
      drawRings(50 * c, 50 * r, a);
      //another way of adding rows and columns for added objects
      for (int d = 0; d < 5; d++) {
        for (int s = 0; s < 4; s++) {
          // drawing center diamonds
          drawCenters(141 * d, 141 * s, b);
          for (int e = 0; e < 4; e++) {
            for (int t = 0; t < 3; t++) {
              drawCenters2(141 * e, 141 * t, f);
            }
          }
        }
      }
    }
  }
}

void drawRings(int xPos, int yPos, int a) {
  smooth();
  // filling in the ellipses
  fill(5, 171, 158, 75);
  // placing ellipse in x and y positions and using size as well
  ellipse(xPos + 20, yPos + 20, a, a); 
  ellipse(xPos + 40, yPos + 20, a, a); 
  fill(5, 171, 158, 75);
  ellipse(xPos + 20, yPos + 40, a, a);
  ellipse(xPos + 40, yPos + 40, a, a);
}

void drawCenters(int xPos, int yPos, int b) {
  fill(255, 255, 255);
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
  rect(xPos + 30.50, yPos + 50.25, b, b); 
  // restores the previous coordinate system
  popMatrix();
}

void drawCenters2(int xPos, int yPos, int f) {
  // adding color
  fill(255, 255, 255);
  // smoothing out objects
  smooth();
  // changing the registration point to the center
  rectMode(CENTER);
  // saves the matrix to the top of the stack
  pushMatrix();
  // transforming the matrix using x and y positions
  translate(415, -155);
  // rotating objects
  rotate(0.77+PI/180);
  // retransforming the matrix
  translate(30, 30);
  // adding rectangles
  rect(xPos - 28, yPos - 50, f, f); 
  // restroing the previous coordinate system
  popMatrix();
}


