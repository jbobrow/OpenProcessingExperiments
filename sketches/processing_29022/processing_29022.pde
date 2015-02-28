
// globabl variables
// declared its name and assigns a value
// x Position
int xPos = 225;
// y Position
int yPos = 225;
// assigning a color using an integer
int change = 0;
int change1 = 0;
int change2 = 0;
int changes = 255;
int changes2 = 255;
int changes3 = 255;

void setup() {
  // size of screen
  size(450, 450);
  // local varibles
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
  // Locally adding another background within the draw method
  background(changes, changes2, changes3);
  // Locally changing the xPosition within the draw method
  xPos = 300;
  // integers a creating size of rectangle and ellipses
  int a = 40;
  int b = 40;
  int f = 37;

  // c = columns (across)
  for (int c = 0; c < 6; c++) {
    // r = rows (down)
    for (int r = 0; r < 6; r++) {
      // spacing between squares
      drawSquares(82 * c, 82 * r, a);
      // d = columns 
      for (int d = 0; d < 5; d++) {
        // s = rows 
        for (int s = 0; s < 5; s++) {
          // spacing between squares
          drawSquares2(82 * d, 82 * s, b);
          // e = columns
          for (int e = 0; e < 6; e++) {
            // t = rows
            for (int t = 0; t < 6; t++) {
              // spacing between circles
              drawEllipse(82 * e, 82 * t, f);
            }
          }
        }
      }
    }
  }
}

void drawSquares(int xPos, int yPos, int a) {
  // color black
  fill(change, change1, change2);
  smooth();
  // placing rectangle in x and y positions
  rect(xPos, yPos, a + .5, a + .5);
}

void drawSquares2(int xPos, int yPos, int b) {
  // color black
  fill(change, change1, change2);
  smooth();
  // placing rectangle in x and y positions
  rect(xPos + 41, yPos + 41, b + .5, b + .5);
}

void drawEllipse(int xPos, int yPos, int f) {
  // color white
  fill(255, 255, 255);
  // minus stroke
  noStroke();
  // smoothingo out objects
  smooth();
  // placing ellipses in x and y positions
  ellipse(xPos + 19.75, yPos + 19.75, f, f);
  ellipse(xPos + 61.5, yPos + 60.25, f, f);
  // color black 
  fill(0, 0, 0);
  // placing ellipses in x and y positions
  ellipse(xPos + 19.75, yPos + 61.5, f, f);
  ellipse(xPos + 61.5, yPos + 19.75, f, f);
}
void mousePressed() {
  // changing the value of colors black and white when mouse
  // is pressed down using an if else statement
  if (change == 255) {
    change = 0;
  }
  else {
    change = 255;
  }
  if (change1 == 255) {
    change1 = 0;
  }
  else {
    change1 = 255;
  }
  if (change2 == 255) {
    change2 = 0;
  }
  else {
    change2 = 255;
  }
  if (changes == 0) {
    changes = 255;
  }
  else {
    changes = 0;
  }
  if (changes2 == 0) {
    changes2 = 255;
  }
  else {
    changes2 = 0;
  }
  if (changes3 == 0) {
    changes3 = 255;
  }
  else {
    changes3 = 0;
  }
}


