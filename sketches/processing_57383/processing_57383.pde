
void setup () {
  size(480, 480);
  smooth();
}
void draw() {
  background (204);
  strokeWeight(2);
  for (int x=20; x<width; x+=60) {
    float mx = mouseX/10;
    float offsetA = random (-mx, mx);
    float offsetB = random (-mx, mx);
    line(x+offsetA, 0, x+40-offsetB, 100);
    line(x+offsetA, 200, x+40-offsetB, 100);
    line(x+40+offsetA, 300, x+offsetB, 200);
    line(x+offsetA, 400, x+40+offsetB, 300);
    line(x+40+offsetA, 500, x+offsetB, 400);
  }
}

