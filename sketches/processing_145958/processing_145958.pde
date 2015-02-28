
int skale = 4;


void setup() {
  size(400, 400, P2D);
  noFill();
  stroke(136, 159, 173);
  strokeWeight(0.1);
  ellipseMode(CORNER);
  background(255,255,255);
  smooth();
}

void draw() {
  scale(skale);
  ellipse(13, 12, 60, 60);
  ellipse(28, 27, 60, 60);
  ellipse(28, 42, 30, 30);
  line(28,57,58,57);
  ellipse(43, 27, 30, 30);
  line(43,42,73,42);
  ellipse(36, 42, 15, 15);
  line(43,42,43,57);
  ellipse(51, 42, 15, 15);
  line(58,42,58,57);
}



