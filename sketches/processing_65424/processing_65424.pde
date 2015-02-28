
float r = 0;

void setup() {
  size(400,400);
  smooth();
  noStroke();
  colorMode(HSB);
  background(0);
}

void draw() {
  translate(200,200);
  fill(r,255,255);
  rotate(r);
  ellipse(0 + r, 0, 4, 4);
  r += 0.2;
}


