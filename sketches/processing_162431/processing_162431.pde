

void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  drawMonster(mouseX, mouseY);
}



void drawMonster(int x, int y) {
  fill(0);
  ellipse(x, y, 90, 100);
  ellipse(x+20, y-15, 70, 70);
  ellipse(x-20, y-15, 90, 69);
  fill(255);
  ellipse(x, y-15, 60, 60);
  stroke(0);
  ellipse(x, y-15, 60, 30);
  fill(#050505);
  ellipse(x, y-15, 50, 10);
  rect(x-50, y+55, 100, 100);
  fill(#FFFFFF);
  ellipse(x, y+30, 50, 30);
}

