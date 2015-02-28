
void setup() {
  size(500, 500);
  background(255);
  noCursor();
}

void draw() {
  noStroke();
  ellipse(mouseX, 250, random(30), random(550));
  fill(mouseX/2);
}
