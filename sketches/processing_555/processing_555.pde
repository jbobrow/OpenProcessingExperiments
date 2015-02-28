
void setup() { 
  size(400,400);
  smooth ();
}
void draw() {
  background(255);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  fill (25, 50, 100);
  ellipse(s, s, s, s);
  fill (255);
  rect(m, 33, m, m);
  fill (155, 200, 50);
  line(h, h, h, 100);
  strokeWeight (2);
  }

