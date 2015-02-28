
void setup() {
  size(640, 360);
  smooth();
  fill(126);
  background(102);
}
void draw() {
  if (mousePressed)
  {
    stroke(255);
  }
  ellipse(mouseX, mouseY, 50, 50);
  stroke(#080808);
}


