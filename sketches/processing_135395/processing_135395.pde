
int aumento = 0;
void setup() {
  size (600, 600);
  colorMode (HSB);
  noFill ();
  background (random(0,20));
  }
void draw () {
  stroke (random (0,255), 255, 255 , 50);
  ellipse (mouseX, mouseY, 30, 30);
  aumento += 2;
}
