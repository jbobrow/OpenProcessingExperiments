
int x = 250;
int y = 350;
int h = 50;
int w = 50;

void setup() {
  size(500,500);
  smooth();
  background(0);
}

void draw() {
  ellipse(x, y, w, h);
}

void mousePressed() {
  w = w + 10;
  h = h + 10;
}

void keyPressed() {
  w = 50;
  h = 50;
  background(0);
}

