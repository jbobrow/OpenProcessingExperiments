

void setup() {
  size(500,500);
  background(0);
  //noFill();
  noStroke();
  smooth();
  frameRate(10);
  colorMode (HSB,100);
}
void draw() {
  float y = random (0,100);
  fill (y,89,93);
  float x = random(40,80);
  ellipse(mouseX,mouseY,x,x);
}

