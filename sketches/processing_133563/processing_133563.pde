
float R;
float G;
float B;
float diam;
float x;
float y;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {

  R = random(100);
  G = random(100);
  B = random(100);
  diam = random(50);
  x = random(width);
  y = random(height);

  noStroke();
  fill(R, G, B, 50);
  ellipse(x, y, diam, diam);
}



