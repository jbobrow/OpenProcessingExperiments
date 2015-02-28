
void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0,189,255);
  } else {
    fill(251,33,151);
  }
  ellipse(mouseX, mouseY, 64, 64);
}


