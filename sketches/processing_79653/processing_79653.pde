
void setup() {
  size(480, 120);
  smooth();
  text ("Michael Tirone", 50, 30);
  fill(0, 102, 153, 51);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}


