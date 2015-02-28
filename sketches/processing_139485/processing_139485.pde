
float angle = 0.0;

void setup() {
  size(500, 500);
  background(0,82,28);
  smooth();
}

void draw() {
  rotate(angle);
  translate(mouseX, mouseY);
  fill(99,73,108);
  rect(-15, -15, 50, 50);
  angle += 0.1;
  fill(94,0,129);
  ellipse(-15, -15, 30, 30);
}


