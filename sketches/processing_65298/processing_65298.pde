
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65083*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// UCLA DMA INTERACTIVITY - SUMMER 2012
// Michael Honhongva
// July 5, 2012 - Workshop 3
  
  // UCLA DMA INTERACTIVITY - SUMMER 2012
// Michael Honhongva
// July 5, 2012 - Workshop 3


float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter



void setup() {
  size(640, 360);
  strokeWeight(40);
  smooth();
  stroke(0, 50);

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  rect(rx, ry, rd, rd);
  if ((mouseX >= rx ) && (mouseX <= rx+rd) && (mouseY >= ry) && (mouseY <= ry+rd)) {
    stroke(250, 50);
  } 
  else {
    fill(250);
  }
  ellipse(ex, ey, ed, ed);
  if ((mouseX >= ex - 53) && (mouseX <= ex+ 53) && (mouseY >= ey - 53) && (mouseY <= ey + 53)) {
    stroke(0, 50);
    strokeWeight(100);
  } 
  else {
    fill(0);
  }
    line(mouseX, mouseY, pmouseX, pmouseY);
}


