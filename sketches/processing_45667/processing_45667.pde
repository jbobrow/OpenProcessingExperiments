
void setup() {
  size (500,500);
  background(0);
  strokeWeight(8);
  stroke(255);
  smooth();
  noCursor();
  frameRate(10);
}

void draw() {
  background(0);
  line (mouseX,mouseY,pmouseX,pmouseY);
}
