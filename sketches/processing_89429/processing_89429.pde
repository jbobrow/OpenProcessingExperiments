
//Homework 6
//Sabrina Li
//Copyright Sabrina Li January 2014 Pittsburgh, PA

float cx, cy, cd, cxSpeed, cySpeed;
float sx, sy, sSize, sxSpeed, sySpeed;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  cx = random(width);
  cy = random(height);
  cd = 80;
  cxSpeed = random(2, 6);
  cySpeed = 1;
  
  sx = random(width);
  sy = random(height);
  sSize = 60;
  sxSpeed = random(2, 6);
  sySpeed = 1;
}

void draw() {
  prepWindow();
  drawCircle(cx, cy, cd);
  moveCircle();
  drawSquare(sx, sy, sSize);
  moveSquare();
}

void prepWindow() {
  fill(20, 180, 200);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void drawCircle(float x, float y, float d) {
  fill(255);
  ellipse(x, y, d, d);
  fill(0);
  rectMode(CENTER);
  rect(x, y, d/1.75, d/1.75);
  fill(255);
  rect(x, y, d/4, d/4);
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

void drawSquare(float x, float y, float sSize) {
  fill(0);
  rectMode(CENTER);
  rect(x, y, sSize, sSize);
  fill(255);
  rect(x, y, sSize/1.5, sSize/1.5);
  fill (0);
  ellipse(x, y, sSize/2.5, sSize/2.5);
}

void moveSquare() {
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
    cxSpeed = random(-6, -2);
  } else {
    cxSpeed = random(2, 6);
  }
  sy = random(height);
  sySpeed = random(2, 6);
}

/*void mousePressed() {
  saveFrame("hw6-####.jpg");
}*/

