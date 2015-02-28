
// global variables
// declare its name and assigns a value
// value of color
int change = 5;
int change2 = 171;
int change3 = 158;
int changes = 106;
int changes2 = 191;
int changes3 = 168;
// x Position
int xPos = 225;
// y Position
int yPos = 225;


void setup() {
  // size of screen
  size(450, 450);
  // local variables
  // another way of adding width and height to the stage
  int stageWidth = width;
  int stageHeight = height;
  // background's color in RGB
  background(106, 191, 168);
  // smooths out objects 
  smooth();
  // adds color to stroke
  stroke(5, 171, 158);
  // using an integer, repeats a line multiple times
  for (int i = 0; i < 460; i += 2) {
    line(i, 0, i + 0, 460);
  }
  // adds weight to stroke
  strokeWeight(1.25);
  // minus fill
  noFill();
}

void draw() {
  // Locally changing the x Position within the draw method
  xPos = 300;
  // integers a and b creating sizes of the ellipses
  int a = 30;
  int b = 10;

  // c = columns (across)
  for (int c = 0; c < 15; c++) {
    // r = rows (down)
    for (int r = 0; r < 15; r++) {
      // drawing main ellipses
      drawRings(30 * c, 30 * r, a); 
      // another way of adding rows and columns for separate ellipses 
      for (int d = 0; d < 8; d++) {
        for (int s = 0; s < 8; s++) {
          // drawing center ellipses
          drawCenters(60 * d, 60 * s, b);
        }
      }
    }
  }
}

void drawRings(int xPos, int yPos, int a) {
  fill(114, 216, 207);
  smooth();
  // placing ellipse in x and y positions
  ellipse(xPos + 15, yPos + 15, a, a);
}

void drawCenters(int xPos, int yPos, int b) {
  // add color using integers globally
  fill(change, change2, change3);
  // smoothing out objects
  smooth();
  // adding circles
  ellipse(xPos + 15, yPos + 15, b, b);
  // again adding color using integers globally
  fill(changes, changes2, changes3);
  ellipse(xPos + 45, yPos + 45, b, b);
}

void mousePressed() {
  // if color is this number, the number will change when the 
  //  mouse is pressed
  if (change == 106) {
    change = 5;
  } 
  else {
    change = 106;
  }
  if (change2 == 191) {
    change2 = 171;
  }
  else {
    change2 = 191;
  }
  if (change3 == 168) {
    change3 = 158;
  }
  else {
    change3 = 168;
  }

  if (changes == 5) {
    changes = 106;
  } 
  else {
    change = 5;
  }
  if (changes2 == 171) {
    changes2 = 191;
  }
  else {
    changes2 = 171;
  }
  if (changes3 == 158) {
    changes3 = 168;
  }
  else {
    changes3 = 158;
  }
}



