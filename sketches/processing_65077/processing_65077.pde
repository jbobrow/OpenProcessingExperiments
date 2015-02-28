
//Kelly Chu
//move mouse over the square and circle; click with mouse

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter


void setup() {
  size(640, 360);
  smooth();


  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(122);
  //square
  stroke(255);
  strokeWeight(2);
  fill(204, 172, 234);
  rect(rx, ry, rd, rd);
  if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd)) {
    fill(0);
    rect(rx-30, ry-30, rd+60, rd+60);
    //face 1
    fill(255);
    ellipse(rx, ry+25, 10, 10);
    ellipse(rx+rd, ry+25, 10, 10);
    noFill();
    arc(rx+rd/2, ry+35, 18, 23, 0, PI);
    if (mousePressed) {
      noStroke();
      fill(255, 246, 217);
      rect(rx-40, ry-40, rd+80, rd+80);
      //face 2
      fill(0);
      ellipse(rx, ry+25, 10, 10);
      ellipse(rx+rd, ry+25, 10, 10);
      arc(rx+rd/2, ry+35, 18, 23, 0, PI);
    }
  }
  //circle
  stroke(255);
  strokeWeight(2);
  fill(255, 246, 217);
  ellipse(ex, ey, ed, ed);
  float d = dist(mouseX, mouseY, ex, ey);
  if (d<ed/2) {
    fill(0);
    ellipse(ex, ey, ed, ed);
    //face 1
    fill(255);
    ellipse(ex-40, ey, 10, 10);
    ellipse(ex+40, ey, 10, 10);
    noFill();
    arc(ex, ey, 18, 23, 0, PI);
    if (mousePressed) {
      noStroke();
      fill(204, 172, 234);
      ellipse(ex, ey, ed+60, ed+60);
      //face 2
      fill(0);
      ellipse(ex-75, ey, 10, 10);
      ellipse(ex+75, ey, 10, 10);
      arc(ex, ey, 18, 23, 0, PI);
    }
  }
}


