
int x=120;
int y=60;
int radius=12;

void setup() {
  size(240, 120);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background (180, 220, 180);
  float d=dist(mouseX, mouseY, x, y);
  if (d<radius) {
    radius++;
    fill(200, 215, 215);
  } else {
    fill(215, 200, 200);
  }
  ellipse(x, y, radius, radius);
}
