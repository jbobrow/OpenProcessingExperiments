
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(255);
  } else {
    fill(random(255),random(255),random(255));
  }
  ellipse(mouseX, mouseY, 80, 80);
}
