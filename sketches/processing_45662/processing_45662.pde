
void setup() {
  size (500,500);
  background(0);
  smooth();
  noStroke();
  noCursor();
}

void draw() {
  float diam=random(2,5);
  ellipse(mouseX,mouseY,diam,diam);
}
