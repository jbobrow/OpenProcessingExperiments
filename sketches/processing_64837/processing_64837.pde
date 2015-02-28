
void setup() {
  size (800, 200);
  smooth();
  rectMode (CENTER);
}

void draw () {
  background (255);
  randomSeed(0);
  for (int i = 35; i< width + 100; i+=80) {
    int gray = int (random(0, 10));
    float scalar = random(0.1, 1.0);
    camera (i, 80, gray, scalar);
  }
}

void camera (int x, int y, int g, float s) {
  pushMatrix ();
  translate (x, y);
  scale(s);
  stroke(g);
  fill (0);
  rect (50, 50, 150, 100);
  rect (-5, -5, 30, 8);
  rect (-5, -10, 20, 5);
  fill(255);
  ellipse (50, 50, 80, 80);
  fill(100);
  ellipse (50, 50, 60, 60);
  fill(0);
  ellipse (50, 50, 30, 30);
  popMatrix();
}


