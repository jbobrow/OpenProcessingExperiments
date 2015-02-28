
/**********************************************************************
 *
 *          Title:  Draw Tool 1
 *         Author:  Terence Caulkins
 *
 *    Description:  Drawing tool created for Processing class @ 3rd Ward.
 *                  Click and hold mouse button to turn on the eraser
 *                  Hit Space to erase entire screen 
 *
 *           Date:  9/25/2011
 *
 **********************************************************************/
 
 void setup() {
  size(600, 600);
  smooth();
  background(255);
}
void draw() {
  noFill();
  if (keyPressed) {
    if (key == ' ') {
      background(255);
    }
  }
  if (mousePressed) {
    fill(255);
    noStroke();
    for (float div=10.; div<100.; div+=5.) {
      ellipse(mouseX, mouseY, width/div, height/div);
    }
  }
  else {
    noFill();
    stroke(0);
    for (float div=10.; div<100.; div+=5.) {
      ellipse(mouseX, mouseY, width/div, height/div);
    }
  }
}


