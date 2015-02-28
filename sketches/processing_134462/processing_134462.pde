
// based upon:
// P_2_2_4_01.pde
//
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de

int maxCount = 500; //max count of the cirlces
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; // radius

void setup() {
  size(500, 500);
  rectMode(CENTER);

  //frameRate(10);

  // first circle
  x[0] = width/2;
  y[0] = height/2;
  r[0] = 10;
  //r[0] = 400;
}


void draw() {
  background(20);

  strokeWeight(0.5);
  //noFill();

  // create a radom set of parameters
  float newR = random(2, 8);
  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);

  float closestDist = 100000000;
  int closestIndex = 0;
  // which circle is the closest?
  for (int i=0; i < currentCount; i++) {
    float newDist = dist(newX, newY, x[i], y[i]);
    if (newDist < closestDist) {
      closestDist = newDist;
      closestIndex = i;
    }
  }

  // aline it to the closest circle outline
  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);

  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
  r[currentCount] = newR;
  currentCount++;

  // draw them
  for (int i=0 ; i < currentCount; i++) {
    fill(255,50);
    noStroke();
    rect(x[i], y[i], r[i]*5, r[i]*5,10);
    fill(#FFDC12);
    ellipse(x[i], y[i], r[i]*2, r[i]*2);
  }

  if (currentCount >= maxCount) noLoop();
}

