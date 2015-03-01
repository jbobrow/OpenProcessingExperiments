
float r;
float g;
float b;
float a;
float spotSize;
float x;
float y;

void setup() {
  size(640, 640);
  background(255);
  smooth();
}

void draw() { 
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);

  spotSize = random(10, 50);
  x = random(width);
  y = random(height);

  noStroke();
  fill(r, g, b, a);
  ellipse(x, y, spotSize, spotSize);
}
