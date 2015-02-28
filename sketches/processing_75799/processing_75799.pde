
// Oliver Haimson  alhaimso
// Homework 10
// Copyright 2012

// citation: some code taken from Jim Roberts' sample class code and modified
// to fit this program.

final int MAX = 50;

float [ ] x;
float [ ] y;
float [ ] deltaX;
float [ ] deltaY;
color [ ] col;


void setup() {
  //size(screen.width, screen.height);
  size(1200, 700);
  //smooth();
  x = initFloatArray(x, 0, width);
  y = initFloatArray(y, 0, height);
  deltaX = initFloatArray(deltaX, -6,6);
  deltaY = initFloatArray(deltaY, 6,9);
  col = initColorArray();
}

void draw() {
  background(0);
  drawCircles();
  moveCircles();
}

float [ ] initFloatArray(float [ ] farray, float low, float high) {
  float [ ] temp = new float [MAX];
  for (int i=0; i<temp.length; i++) {
    temp[i] = random(low, high);
  }
  return temp;
}

color [ ] initColorArray( ) {
  color [ ] tempColor = new color [MAX];
  for (int i=0; i<tempColor.length; i++) {
    tempColor[i] = color(random(90, 150), random(33, 40), random(25, 49));
  }
  return tempColor;
}

void moveCircles() {
  for (int i=0; i<x.length; i++) {
    x[i] += deltaX[i];
    y[i] += deltaY[i];
  }
}

void drawCircles() {
  noStroke();
  for (int i=0; i<x.length; i++) {
    fill(col[i]);
    strokeWeight(3);
    if (x[i] >= width || x[i] <= 0 || y[i] >= height || y[i] <= 0) {
      deltaX[i] = -deltaX[i];
      deltaY[i] = -deltaY[i];
    }
    ellipse(x[i], y[i], x[i]*.6, y[i]*.6);
  }
}


