
void setup() {
  size(500,400);
}

void draw() {
  background(0);

  stroke(0);
  fill(255);
  ellipse(250, 200, abs(-250+mouseX)*2, abs(-200+mouseY)*2);
}
