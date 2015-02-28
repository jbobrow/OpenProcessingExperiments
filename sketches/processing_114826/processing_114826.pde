
void setup() {
  size(600, 600);
  smooth();
}
void draw() {
  background(255, 70, 20);
  fill(100, 255, 20);
  for ( int b = 0; b <= height; b += height/20) {
    for (int a = 0; a <= width; a = a + 80) {
      ellipse(a, random(width), 25, 25);
    }
  }
  fill(50, 200, 80);
  for ( int d = 0; d <= height; d += height/10) {
    for (int c = 0; c <= width; c = c + 50) {
      ellipse(random(height), d, 15, 15);
    }
  }

  stroke(255, 242, 0);
  for (int x = 0; x <= width; x = x + 10) {
    line(x, 0, 50, 100);
    line(x, height, 550, 500);
  }
  stroke(158, 255, 159);
  for (int y=0; y<= height; y= y+5) {
    line(0, y, 50, 100);
    line(width, y, 550, 500);
  }
  stroke(194, 206, 255);
  for (int e=0; e<= height; e= e+10) {
    line(e, 0, 200, 200);
    line(e, height, 400, 400);
  }
  stroke(194, 255, 255);
  for (int f=0; f<= height; f=f+20) {
    line(0, f, 200, 200);
    line(width, f, 400, 400);
  }
}
