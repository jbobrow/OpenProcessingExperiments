
void setup() {
  size(480, 480);
}

void draw() {
  if (mousePressed) {
    fill(32,145,241);
  } else {
    fill(25,2,190);
  }
  ellipse(mouseX, mouseY, 80, 80);
}



