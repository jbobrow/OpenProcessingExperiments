
void setup() {
  size(500, 500);
  background(0);
}

float y = 50;
float s = 0.02;
float w = -225.;

void draw() {
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  translate(0, 250);
  float yy = map(sin(y), 1., -1., w, 500.);
  fill(255);
  ellipse(250, yy, 100, 50);
  if (yy > 250.) {
    y = 50.;
  }
  y = y+s;
}

