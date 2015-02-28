
void setup() {
  size(640, 400);
  background(255);
}

void draw() {

  smooth();
  noStroke();
  float a = map(mouseX, 0, width, 0, 100);
  float diameter = map(mouseY, 0, height, 1, 50);
  fill(#5CD6E3, a);

  if (mousePressed && (mouseButton == LEFT)) {
    ellipse(mouseX, mouseY, diameter, diameter);
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    background(255);
  }
  else {
    // Do Nothing
  }
}
                                                
