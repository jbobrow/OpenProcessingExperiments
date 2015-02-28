
void setup () {
  size (500, 500);
  smooth ();
  noLoop ();
}

void draw () {
  background (0, 206, 255);
  for (int c=50; c<500; c +=100) {
    for (int d=1; d<500; d += 150) {
      sailboat (c, d);
      wave (c, d+20);
    }
  }
}

void sailboat (int x, int y) {
  noStroke ();
  fill (random (150,255), 0, 229);
  arc (x, y, 100, 90, 0, PI);
  fill (188, 160, 84);
  rect (x-5, y-100, 10, 100);
  fill (0, 255, random (100, 220));
  triangle (x+5, y-100, x+5, y-50, x+50, y-75);
  fill (255, 255, 255, 150);
  ellipse (x, y+10, 10, 10);
  ellipse (x-20, y+10, 10, 10);
  ellipse (x+20, y+10, 10, 10);
}

void wave (int a, int b) {
  stroke (21, 10, b/2);
  noFill ();
  strokeWeight (6);
  for (int i=-50; i<520; i += 50) {
    arc (a+i, b, 50, 50, 0, PI);
  }
}

