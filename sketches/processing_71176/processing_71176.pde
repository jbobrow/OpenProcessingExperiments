
void setup () {

  size (600, 600);
  smooth ();
  background(0);
}

void draw () {

  fill (mouseX/2, mouseY/2, 255, 80);

  stroke(mouseY, 255, mouseX, 70);
  strokeWeight(3);
  noFill();
  ellipse (300, 300, mouseX, mouseY);

  if (mouseX > 0) {
    line(300, 300, mouseX, mouseY);
  }
}


