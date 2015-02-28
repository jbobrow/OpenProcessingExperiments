

int x = 120;
int y = 60;
int radius = 12;

void setup() {
  size(500, 500);
  smooth();
  
  ellipseMode(RADIUS);
  noStroke();
}

void draw() {
  background(106,152,2);
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    radius++;
    fill(5,43,103);
    noStroke();
  } else {
    fill(5,43,103);
  }
  ellipse(x, y, radius, radius);
}


