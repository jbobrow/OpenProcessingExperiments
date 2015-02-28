
// Oliver Haimson
// Chaos vs. order
// Copyright 2012

float r, r2, r3;

void setup() {
  size(650, 400);
  smooth();
}

void draw() {
  background(25, 209, 66);
  r = map(mouseX, 0, width, 0, 40);
  for (int i=0; i<(width-40); i+=(50-r)) {
    for (int j=0; j<(height-40); j+=(50-r)) {
      fill(255-r*6, 255-random(0, r*3), 255-r*4);
      ellipse(i+25+r*random(-.25, .25), j+25+r*random(-.25, .25), 20, 20);
    }
  }
}

void keyPressed() {
  if (key=='p') {
    noLoop();
  }
  else if (key==' ') {
    loop();
  }
}
