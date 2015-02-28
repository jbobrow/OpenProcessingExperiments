
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
  background(255, 255, 255);
  // smooths out objects
  smooth();
  // minus fill
  noFill();
}

void draw() {
  // Locally changing the xPosition within the draw method
  xPos = 300;
  // integers a creating size of ellipses
  int b = 60;
  int f = 60;

  // d = columns
  for (int d = 0; d < 11; d++) {
    // s = rows 
    for (int s = 0; s < 11; s++) {
      // spacing between circles
      drawEllipses(42 * d, 82 * s, b);
      // e = columns
      for (int e = 0; e < 11; e++) {
        // t = rows
        for (int t = 0; t < 11; t++) {
          // spacing between circles
          drawEllipse(42 * e, 83 * t, f);
        }
      }
    }
  }
}

void drawEllipses(int xPos, int yPos, int b) {
  // gray color
  fill(233, 220, 188);
  // adding black stroke
  stroke(0, 0, 0);
  // adding weight to stroke
  strokeWeight(2);
  // smoothing out objects
  smooth();
  // placing ellipses in x and y positions
  ellipse(xPos + 9, yPos + 60, b, b);
  // minus fill, just the stroke
  noFill();
  ellipse(xPos + 9, yPos + 59.75, b - 10, b - 10);
  ellipse(xPos + 9, yPos + 59.75, b - 20, b - 20);
  ellipse(xPos + 9, yPos + 59.75, b - 30, b - 30);
  ellipse(xPos + 9, yPos + 59.75, b - 39.75, b - 39.75);
}

void drawEllipse(int xPos, int yPos, int f) {
  // color gray
  fill(233, 220, 188);
  // adding black stroke
  stroke(0, 0, 0);
  // adding weight to stroke
  strokeWeight(2);
  // smoothing out objects
  smooth();
  // placing ellipses in x and y positions
  ellipse(xPos + 19.75, yPos + 19.75, f, f);
  // minus the fill, just the stroke 
  noFill();
  ellipse(xPos + 19.75, yPos + 19.75, f - 10, f - 10);
  ellipse(xPos + 19.75, yPos + 19.75, f - 20, f - 20);
  ellipse(xPos + 19.75, yPos + 19.75, f - 30, f - 30);
  ellipse(xPos + 19.75, yPos + 19.75, f - 39.75, f - 39.75);
}


