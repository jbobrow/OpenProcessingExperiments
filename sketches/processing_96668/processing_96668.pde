
int x = 500;
int y = 340;
int radius = 12;

void setup() {
  size(1000, 680); 
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(204);
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    radius++;
    fill(255, 0, 0);
  } else {
    fill(100, 50, 255);
  }
  ellipse(x, y, radius, radius);
}



