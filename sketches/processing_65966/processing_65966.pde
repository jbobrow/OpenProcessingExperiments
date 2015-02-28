
int c = 100;

void setup() {

  size(600, 900);
  background(255);

  smooth();
  background(255);
  //frameRate(3);

  float randx = random(width);
  float randy = random(height);
}


void draw() {
  strokeWeight(random(150));
  fill(60, 40, 100, 20);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  int step = 50;
  float lastx = -999;
  float lasty = -999;
  float y = 50;
  int borderx = 20;
  int bordery = 10;
  colorMode(HSB, 100, 100, 100);
  stroke(random(10, 95), random(100), random(100), 100);
  for (int x = borderx; x<=width-borderx; x+=step) {
    y = bordery + random(height-2*bordery);
    if (lastx > -999) {
      line(x, y, lastx, lasty);
      line(y, x, lasty, lastx);
      ellipse(y, x, x, y);
    }
    lastx = x;
    lasty = y;
  }
}
