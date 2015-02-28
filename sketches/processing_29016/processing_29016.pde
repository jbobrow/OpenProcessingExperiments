
// globabl variables
// declared its name and assigns a value
// x Position
int xPos = 225;
// y Position
int yPos = 225;

void setup() {
  // size of screen
  size(450, 450);
  // local varibles
  // stops animation
  noLoop();
  // another way of adding width and height to the stage
  int stageWidth = width;
  int stageHeight = height;
  // background's color in RGB
  background(213, 213, 213);
  // smooths out objects
  smooth();
  // minus the fill
  noFill();
}

void draw() {
  // Locally changing the xPosition within the draw method
  xPos = 300;
  // changing the registration point to the center
  rectMode(CENTER);
  // integers a, b, and f creating size of rectangle
  int a = 45;
  int b = 30;
  int f = 65;

  // e = columns
  for (int e = 0; e < 5; e++) {
    // t = rows
    for (int t = 0; t < 1; t++) {
      // spacing between squares
      drawSquare(127 * e, 130 * t, f);
      // d = columns 
      for (int d = 0; d < 5; d++) {
        // s = rows 
        for (int s = 0; s < 1; s++) {
          // spacing between squares
          drawSquares(127 * d, 127 * s, b);
          // c = columns (across)
          for (int c = 0; c < 10; c++) {
            // r = rows (down)
            for (int r = 0; r < 10; r++) {
              // spacing between squares
              drawSquares2(45 * c, 45 * r, a);
            }
          }
        }
      }
    }
  }
}

void drawSquare(int xPos, int yPos, int f) {
  // minus the stroke
  noStroke();
  // adding fill to objects
  fill(243, 243, 243);
  // smoothing out objects
  smooth();
  // saves the matrix at the top of the stack
  pushMatrix();
  //transforming the matrix using the x and y positions
  translate(45, 45);
  // rotating the rectangles locally within the matrix
  rotate(0.77+PI/180);
  // retransforming the matrix
  translate(-15, -15);
  // placing rectangle in x and y positions
  rect(xPos - 273, yPos - 273, f, f);
  rect(xPos - 209, yPos - 209, f, f);
  rect(xPos - 145, yPos - 145, f, f);
  rect(xPos - 81, yPos - 81, f, f);
  rect(xPos - 17, yPos - 17, f, f);
  rect(xPos + 47, yPos + 47, f, f);
  rect(xPos + 111, yPos + 111, f, f);
  rect(xPos + 174, yPos + 174, f, f);
  rect(xPos + 238, yPos + 238, f, f);
  rect(xPos + 302, yPos + 302, f, f);
  // restores the previous coordinate system
  popMatrix();
}

void drawSquares(int xPos, int yPos, int b) {
  // takes out the stroke
  noStroke();
  // color 
  fill(193, 193, 193);
  // smooths out objects
  smooth();
  // saves the matrix at the top of the stack
  pushMatrix();
  //transforming the matrix using the x and y positions
  translate(45, 45);
  // rotating rectangle
  rotate(0.77+PI/180);
  // retransforming the matrix
  translate(-15, -15);
  // placing rectangle in x and y positions
  rect(xPos - 272, yPos - 272, b, b);
  rect(xPos - 176, yPos - 176, b, b);
  rect(xPos - 80, yPos - 80, b, b);
  rect(xPos + 15, yPos + 15, b, b);
  rect(xPos + 110, yPos + 110, b, b);
  rect(xPos + 205, yPos + 205, b, b);
  rect(xPos + 300, yPos + 300, b, b);
  // restores the previous coordinate system
  popMatrix();
}

void drawSquares2(int xPos, int yPos, int a) {
  // color black
  smooth();
  // adds stroke 
  stroke(225, 225, 225);
  // adds weight to stroke
  strokeWeight(1);
  // minus the fill
  noFill();
  // placing rectangle in x and y positions
  rect(xPos + 22, yPos + 22, a, a);
}


