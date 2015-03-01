
void setup() {
  size(400,400);
  strokeWeight(8);
  smooth();
}

void draw() {
  background(mouseX, mouseY, 50);
  float angle = map(mouseX, 0, width, 0, TWO_PI);
  translate(50, 50);
  rotate(angle);
  rect(40, 40, 60, 60);
  ellipse(mouseX+100, 70, mouseY+50, 100);
  fill(mouseX+10, 10, mouseY+10, mouseX+10);
}


