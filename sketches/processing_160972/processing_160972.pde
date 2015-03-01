
void setup() {
  size(300, 300);
}
void draw() {
  background(255);
  drawStickman(mouseX, mouseY);
}

void drawStickman(int x, int y) {
  fill(0);
  ellipse (x, y, 50, 50);
  rect (x-25, y+25, 50, 100);
  line (125, 85, 100, 160);
  line (175, 85, 200, 160);
  line (130, 185, 130, 250);
  line (170, 185, 170, 250);
}

//Had trouble connecting the lines. I tried many variations using x and y.








