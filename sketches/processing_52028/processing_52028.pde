
void setup() {
  size(501, 501);
  smooth();
}

int x, y;

void draw() {
  background(0);
  for (int x = 10; x < 500; x = x+20) {
    for (int y = 10; y < 500; y = y+20) {
      //draw a lot of eyes
      fill(255);
      ellipse(x, y, 20, 20);
      //Eye balls
      int pX = (int) map(mouseX, 0, width, -6, 6);
      int pY = (int) map(mouseY, 0, height, -6, 6);
      //to limit mouseX and mouseY
      fill(0);
      ellipse(x + pX, y + pY, 5, 5);
      //Iris
    }
  }
}
