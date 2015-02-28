
float r = 0;
void setup() {
  size(400, 400);
  background(10);
  smooth();
  noStroke();
  frameRate(1000);
  colorMode(HSB);
}

void draw() {
  fill(r%255,255,255);
  rotate(r);
  ellipse(100+r, 0, 10, 10);
  fill(255-r,255,255);
  ellipse(90+r, 10, 10, 10);
  r += 0.2;
}


