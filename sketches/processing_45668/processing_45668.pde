
void setup() {
  size (500,500);
  background(0);
  smooth();
  noStroke();
  noCursor();
}

void draw() {
  float diam=abs(pmouseX-mouseX);
  ellipse(mouseX,mouseY,diam,diam);
}
