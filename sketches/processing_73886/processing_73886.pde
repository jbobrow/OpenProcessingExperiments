
// Oliver Haimson 
// Assignment 06D
// Copyright 2012

float time, c;

void setup() {
  size(500, 500);
  smooth();
  background(0);
  c=0;
}

void draw() {
  noStroke();
  time = millis()/1000;
    fill(60, 80, 201);
    ellipse(time*c*.5, height*.5, time*c, time*c);
    c+=.4;
  if (time >=5) {
    fill(0);
    for (int i=1; i<50; i++) {
      strokeWeight(random(5));
      stroke(random(100), random(100), random(150, 255));
      float sz=random(10);
      ellipse(random(width), random(height), sz, sz);
    }
  }
}
