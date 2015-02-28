
int x = 200;
int y = 200;
int r = 120;
 

void setup() {
  size(400, 400);
}
 

void draw() {
  background(120);
  noStroke();
  float d = dist(mouseX, mouseY, x, y);
  if (d < r/2) {
    fill(120);
  }
  else {
    fill(250, 0, 0);
  }
  ellipse (x, y, r, r);
}
