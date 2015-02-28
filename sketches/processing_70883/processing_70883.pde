
void setup() {
  size (500, 500);
  background(255, 255, 255);
  smooth();
  noLoop();
}

void draw() {
  for (int a=1; a<=width; a+= 20)
  {
    for (int b=1; b<=height; b+= 20)
    {
      fill(0, 0, 0);
      int r = int (random(1, 6.99));
      if (r == 1) {
        triangle(a, b, a+20, b+20, a+20, b+0);
      }
      if (r == 2) {
        triangle(a+20, b+20, a+0, b+20, a+0, b+20);
      }
      if (r == 3) {
        triangle(a, b+20, a+20, b+20, a+20, b+0);
      }
      if (r == 4) {
        triangle(a, b, a+20, b+20, a+20, b+0);
      }
    }
  }
}
