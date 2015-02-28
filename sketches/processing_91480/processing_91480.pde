
// Homework 8
// Joseph Oak © 2013
// Press 1 or 2 to change the central shapes

float diam, x, randI, state, value, deltaX;

void setup() {
  size(400, 400);
  background(255);
  diam = 15;
  x = 15;
  randI = 10;
  rectMode(CENTER);
  frameRate(10);
  state = 1;
}

void draw() {
  noStroke();
  fill(255);
  rect(width/2, height/2, width, height);
  if (state == 1) {
    whileLoop();
  } else if (state == 2) {
    whileLoop2();
  }
  forLoop();
}

void whileLoop() {
  diam = 0;
  randI = 5;
  while (diam <= width) {
    stroke(200);
    noFill();
    rect(width/2, height/2, diam, diam);
    randI = randI * 2;
    diam = diam + randI;
  }
}

void whileLoop2() {
  diam = 0;
  randI = 5;
  while (diam < width) {
    stroke(200);
    noFill();
    ellipse(width/2, height/2, diam, diam);
    randI = randI * 2;
    diam = diam + randI;
  }
}

void keyPressed() {
  if (key == '1') {
    state = 1;
  } else if (key == '2') {
    state = 2;
  }
}

void forLoop() {
  for (int x = 0; x < width; x += random(8, 10)) {
    stroke(200, 227.5, 255);
    line(0, x + height/2, width, x + height/2);
  }
}

