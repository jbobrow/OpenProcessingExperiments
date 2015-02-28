
void setup() {
  size (600, 600);
  colorMode (HSB);
  noStroke ();
  background (random(0,20));
  }
void draw () {
  fill (random (200,255), 255, 200, 25);
  ellipse (mouseX, mouseY, 50, 50);
  ellipse (mouseY, mouseX, 50, 50);
  ellipse (height-mouseY, width-mouseX, 50, 50);
  ellipse (width-mouseX, height-mouseY, 50, 50);
  ellipse (height-mouseY, mouseX,50, 50);
  ellipse (mouseX,height-mouseY,50, 50);
  ellipse (mouseY, width-mouseX,50, 50);
  ellipse (width-mouseX,mouseY,50, 50);
}

