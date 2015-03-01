
void setup () {
  size (700, 700);
}

void draw () {
  background (0);
  fill(100);
  rect (300, 50, 200, 550);
  int x=350;
  int y=100;

  while (y<height) {
    drawWindow(x, y);
    drawWindow(X+100, Y);
    y=y+80;
  }
}
void drawWindow (int x, int y) {
  rect (x-20, y-20, 40, 40);
  line (x-20, y, x+20, y);
  line (x, y+20, x, y-20);
}

