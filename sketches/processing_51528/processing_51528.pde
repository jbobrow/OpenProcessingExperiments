
/*****************************************
 * Assignment # 2
 * Name: Hao Wang
 * E-mail:hwang1@haverford.edu
 * Course:CS 110 - Section # 2
 * Submitted: 2/7/2012
 * This sketch depicts a horizon that is represented by a variable. When the 
 mouse is clicked above the horizon, a cloud will be drawn. When the mouse is
 clicked below the horizon, rocks will be drawn.
 At the same time, as mouse is clicked closer to the horizon, the objects
 being drawn will be smaller and smaller and eventually vanish as the mouse
 is approaching to the horizon.
 Since the y coordinate of the horizon is set to be a variable "horizonY"
 ranging from 50 to 600, each time the program is run, the horizon will appear
 at a different location in the middle of the screen.
 Also, iteration is used to draw the rocks.
 ***********************************************/
float horizonY =random(50, 600);
float scal2=(mouseY-horizonY)/(height-horizonY);
// Declare variables. The horizon here will appear on different locations
//each time the program is run.

void setup() {
  smooth ();
  noStroke();
  size (800, 800);
  line (0, horizonY, width, horizonY);
  // Set up the drawing with the horizon as a variable

  rectMode (CORNER);
  fill (99, 145, 234);
  rect (0, 0, width, horizonY);
  fill (75, 185, 133);
  rect (0, horizonY, width, height-horizonY);
  fill (255, 255, 0);
  ellipse (width/8, horizonY/8, horizonY/6, horizonY/6);
}
// Draw the sky with a sun (scaled so that it is proportional to the 
// space of the sky). Also, the ground is drawn.



void draw() {
}
//help run the functions below.

void mousePressed() {
  if (mouseY < horizonY) {
    drawCloud(mouseX, mouseY);
  }
  if (mouseY> horizonY) {
    drawRock(mouseX, mouseY, 80, scal2);
  }
}
// Use the mouseY position to decide whether drawing on sky or on ground

void drawCloud (int x, int y) {
  float scal1=(horizonY-mouseY)/horizonY;
  // Compute scale factor
  fill (255);
  ellipse (mouseX, mouseY, scal1*width/8, scal1*height/15);
  ellipse (mouseX, mouseY-0.5*scal1*height/15, scal1*width/15, scal1*height/20);
}
// Draw a cloud on the location where mouse
// is pressed with approapriate scale factor.

void drawRock (int x, int y, int n, float scal) {
  float scal2=(mouseY-horizonY)/(height-horizonY);
  // Compute scale factor
  float size1= scal2*(width/50);
  float size2= scal2*(height/40);
  float angle = 2*PI/n;
  for (int i = 0; i <n; i++ ) {
    fill (random (0, 255), random (0, 255), random (0, 255), random (50, 255));
    rect (x+size1*cos(angle*i), y+size2*sin(angle*i), size1, size2);
  }
}
// Draw a rock with random color where mouse is pressed with scale factor that
//is proportional to the distance from ground to the horizon.


