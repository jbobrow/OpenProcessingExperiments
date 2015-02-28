
float r=0;
void setup() {
  size (600, 600);
  colorMode (HSB);
  background (255);
}
void draw() {
  noStroke ();
  fill(random(r*58), random(r/698), random(r/6), random(r/680));
  //fill(68, r/5, 255, r*9);
  ellipse (mouseX, mouseY, 50, 50);
  ellipse (mouseY, mouseX, 50, 50);
  r += 30;
}

