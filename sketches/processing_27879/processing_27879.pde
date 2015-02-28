
void setup () {
  size (500, 500);
  smooth ();
  frameRate(100);
}

void draw () {
  fill (255, 255, 255, 40);
  rect (0, 0, 500, 500);
  fill (0);  
  ellipse (random (500), random (500), 5, 5);
  ellipse (mouseX +- random (3), mouseY +- random (3), 100, 100);
  if (mousePressed) {
      frameRate(10);
      noStroke ();
      fill (0, 0, 0, 40);
      rect (0, 0, 500, 500);
      fill (255);
      ellipse (mouseX +- random (3), mouseY +- random (3), 105, 105);
  } else {
      frameRate(100);
  }
}

