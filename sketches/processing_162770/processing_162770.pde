
void setup() {
  size (800, 600);
}

void draw() {
  background(0);
  fill(100);
  rect(300, 50, 200, 550);
  int x = 350;
  int y = 100;
  println( mouseX+mouseY);


    while (y<height) {
      drawWindow(x, y);
      drawWindow(x+100, y);
      y= y+65;
    }
}

void drawWindow(int x, int y) {
  fill(100, 100, 0);
  rect(x-20, y-20, 40, 40);
  stroke(255);
  line(x-20, y, x+20, y);
  line(x, y+20, x, y-20);
}

