
//project 1 - Rorsach Creator
//Copyright Alex Mallard 2012
//Click the mouse to draw an ink blot, drag the mouse to draw more in a
//line that follows the mouse. Click 'r' to reset the image.

import processing.pdf.*;

float r, rx, ry;

void setup () {
  size (600, 600);
  smooth ();
  background (255);
}

void draw () {

  r = random (0, 40);
  rx = mouseX;
  ry = mouseY;
  drawInkBlots (rx, ry, r);
  
}

void keyPressed () {
  if (key == 'r') {
    background (255);
  }
}

void drawInkBlots (float x, float y, float dia) {
  fill (0);
  if (mousePressed) {
    dia += 1;
    ellipse (x, y, r, r);
    ellipse (width - x, y, r, r);
  }
}
