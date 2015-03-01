
void setup() {
  size (600, 600);
}
int x = 0;
int y = 0;
void draw() {
  while (x < width) {
    while (y < height) {
      float r1 = random(255);
      float r2 = random(255);
      float r3 = random(255);
      fill(r1, r2, r3);
      stroke(r1,r2,r3);   
      rect(x, y, 20, 20);
      y = y + 20;
    }
    x = x + 20;
    y = 0;
  }
  x=0;
}

