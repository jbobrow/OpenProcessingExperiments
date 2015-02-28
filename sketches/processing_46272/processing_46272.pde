
int farve = 0;
int circleSize = 40;

void setup() {
  size(800, 800);
  smooth();
  background(255);
  colorMode(HSB);
}

void draw() {
  fill(farve, 255, 255);
  ellipse(mouseX, mouseY, circleSize, circleSize);
  ellipse(width - mouseX, mouseY, circleSize, circleSize);
  ellipse(mouseX, height - mouseY, circleSize, circleSize);
  ellipse(width - mouseX, height - mouseY, circleSize, circleSize);
  farve = (farve + 1) % 256;
}

