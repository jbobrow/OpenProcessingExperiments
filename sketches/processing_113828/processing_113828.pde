
int diameter = 100;

void setup() {
  size(400, 400);
}

void draw() {
  background(227, 209, 185);
  noStroke();
  fill(diameter, diameter, diameter);
  ellipse(mouseX, 100, diameter, diameter);
}


