
void setup() {
  size(200, 200);
}


void draw() {
  drawBullseye(width/2, height/2);
}
void drawBullseye(int x, int y) {
  int w=100;
  while (w>0) {
    if (w==10) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    ellipse(x, y, w, w);
    w=w-10;
  }
}
