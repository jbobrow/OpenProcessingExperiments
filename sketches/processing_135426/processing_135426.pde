
void setup() {
  size(500,500);
  background(255);
}

float x = 0;

void draw() {
  float xx = map(sin(x), -1., 1., 0., 500.);
  noStroke();
  fill(0, 50);
  rect(0,0,500,500);
  fill(255);
  ellipse(xx,300,50,50);
  x = x+0.02;
}
