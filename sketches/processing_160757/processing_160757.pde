
void setup() {
  background(255);
  size(400, 400);
}
void draw() {

  man(mouseX, mouseY);
}
void man(int x, int y) {
  background(255);
  ellipse(x, y, 100, 100);
  line(x, y+50, x, y+200);
  line(x, y+100, x-25, y+140);
  line(x, y+100, x+25, y+140);
  line(x, y+200, x-25, y+240);
  line(x, y+200, x+25, y+240);
}

