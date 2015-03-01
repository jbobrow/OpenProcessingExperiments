
float diameter;
float angle = 0;

void setup() {
  size(500, 500);
  background(0);
  diameter = 500;
}

float xoff = 0.0;

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, 500, 500);
  float c = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  angle += 0.02;
  fill(0, random(100, 200), random(100, 200));
  if (mousePressed) {
    rect(c, n, n/2, n/2);
  } else {
  ellipse(c, n, n/2, n/2);
  }
  if (keyPressed) {
    filter(ERODE);
  }
}


