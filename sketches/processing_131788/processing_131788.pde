
void setup() {
  size(700,700);
  background(255);
}

void draw() {
  noStroke();
  fill(mouseX,mouseY,0);
  ellipse(mouseX,mouseY,75,75);
}
