
void setup() {
  size(650, 550);
}
void draw() {
  background(255);
  drawStickfigure(mouseX, mouseY);
}
void drawStickfigure(int x, int y) {
  ellipse(x, y, 87, 87);
  {
    fill(0);
  }
  line(x, y+200, x, y);
  line(x+100, y+80, x-100, y+75);
  line(x-100, y-80, x-100, y+75);
  line(x+100, y-90, x+100, y+75);
  line(x+50, y+350, x, y+200);
  line(x-50, y+350, x, y+200);
}
