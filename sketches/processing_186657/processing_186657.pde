
int x1=10;
int x2=50;
int x3=20;
int y1=80;
int y2=30;
int y3=10;

void setup() {
  size(600, 600);
  background(115,116,116);
}


void draw() {
  stroke(255);
  fill(0);
  ellipse(mouseX, mouseY, x2, y3);
  ellipse(mouseX, mouseY, x3, y2);
  ellipse(mouseX, mouseY, x1, y1);
}

