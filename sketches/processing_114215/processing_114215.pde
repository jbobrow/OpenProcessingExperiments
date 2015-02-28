
//Lauren Hartman
//lmhartma@andrew.cmu.edu
//Copyright Lauren Hartman Oct 2013
 
float cx, cy, cd, cxSpeed, cySpeed;
float sx, sy, sSize, sxSpeed, sySpeed;
 
void setup() {
  size(400, 400);
  noStroke();
  cx = random(width);
  cy = random(height);
  cd = 100;
  cxSpeed = random(2, 4);
  cySpeed = 2;
   
  sx = random(width);
  sy = random(height);
  sSize = 40;
  sxSpeed = random(2, 4);
  sySpeed = 2;
}
 
void draw() {
  prepWindow();
  drawCircle(cx, cy, cd);
  moveCircle();
  drawCircle2(sx, sy, sSize);
  moveCircle2();
}
 
void prepWindow() {
  fill(20, 20, 50, 20);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
}
 
void drawCircle(float x, float y, float d) {
  fill(20, 20, 50);
  stroke (255);
  strokeWeight(25);
  ellipse(x, y, d, d);
  ellipseMode(CENTER);
  noStroke();
  fill(255, 180, 0);
  ellipse(x, y, sSize/1.5, sSize/1.5);
}
 
void moveCircle() {
  cx += cxSpeed;
  cy += cySpeed;
  if (cx > width) {
    cxSpeed = -cxSpeed;
  } else if (cx < 0) {
    cxSpeed = -cxSpeed;
  };
  if (cy > height) {
    cySpeed = -cySpeed;
  } else if (cy < 0) {
    cySpeed = -cySpeed;
  }
}
 
void drawCircle2(float x, float y, float sSize) {
  fill(255, 180, 0);
  stroke (255);
  strokeWeight(5);
  ellipse(x, y, sSize/3.5, sSize/3.5);
}
 
void moveCircle2() {
  sx += sxSpeed;
  sy += sySpeed;
  if (sx > width) {
    sx = 0;
  };
  if (sy > height) {
    sy = -sySpeed;
  }
}
   
void keyPressed() {
  if (cx > width || cy > width) {
    cxSpeed = random(-4, -2);
  } else {
    cxSpeed = random(2, 4);
  }
  sy = random(height);
  sySpeed = random(2, 4);
}
