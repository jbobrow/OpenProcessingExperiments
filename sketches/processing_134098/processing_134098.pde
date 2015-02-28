
int aumento = 0;
void setup() {
  size (600, 600);
  colorMode (HSB);
  noStroke ();
  background (random(0,20));
  noCursor();
  }
void draw () {
  fill (random (0,255), 255, 255 , 50);
  ellipse (mouseX, mouseY, 30, 30);
  aumento += 2;
}

