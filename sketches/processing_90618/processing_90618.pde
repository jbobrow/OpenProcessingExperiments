
int x = 100;

void setup() {
size(400, 400);
}

void draw() {
  background(0);
  ellipse(mouseX, mouseY, x, x);
}

void mousePressed() {
 x=200;
}

void mouseReleased() {
  x=50;
}
