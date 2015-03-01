
void setup() {
  size(800, 600);
}
void draw() {
  background(255);
  fill(180);
  rect(300, 50, 200, 550);
  int x = 350;
  int y =100;

  while (y < height) {
    drawWindow(x, y);
    drawWindow(x+100, y);
    y = y + 80;
  }
}

void drawWindow (int x, int y) {
  fill(150, 130, 0);
  rect(x-20, y-20, 40, 40);
  stroke(255,0,0);
  line(x-20, y, x+20, y);
  line(x, y+20, x, y-20);
}
