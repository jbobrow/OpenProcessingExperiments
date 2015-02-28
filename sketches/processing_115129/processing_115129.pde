
int r = 60;
float x1, y1, x2, y2, x3, y3;

void setup() {
  size(500,500);
  background(50);
  fill(150, 50);
  noStroke();
  frameRate(30);
}

void draw() {
  x1 = mouseX;
  y1 = mouseY - r;
  x2 = mouseX + r * cos(-PI/6);
  y2 = mouseY - r * sin(-PI/6);
  x3 = mouseX - r * cos(-PI/6);
  y3 = mouseY - r * sin(-PI/6);
  triangle(x1, y1, x2, y2, x3, y3);
}


