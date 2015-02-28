
float r = 255;
float g = 255;
float b = 255;

float x = width;
float y = height;
float x2;
float y2;

void setup() {
  size (500, 500);
  background(255);
  smooth();
}

void draw() {
  color c1 = color(r, g, b);
  r = random (255);
  g = random (255);
  b = random (255);

  x = random (500);
  y = random (500);
  x2 = random(50);
  y2 = random(50);
  fill (c1);
  ellipse(x, y, y2, x2);

  if (mousePressed) {
    saveFrame("thumbnail.png");
  }
}


