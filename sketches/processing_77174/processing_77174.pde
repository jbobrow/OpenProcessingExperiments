
PFont f;

void setup() {
  size (800, 600);
  background (50);
  smooth ();
  f = createFont ("Verdana Bold", 16, true);
}
void draw() {
  fill (0, 25);
  noStroke ();
  rect (440, 545, 345, 35);
  fill (0, 25);
  noStroke ();
  rect (0, 0, width, 25);
  textFont (f, 32);
  fill (255, 100, 100, 25);
  noStroke ();
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (255, 100, 100, 25);
  noStroke ();
  text ("created with Processing and Processing.js", 20, 20);
  if (mousePressed) {
    fill (0);
    stroke (255);
  } else {
    fill (255);
    stroke (0);
  }
  ellipse (mouseX, mouseY, 80, 80);
}


