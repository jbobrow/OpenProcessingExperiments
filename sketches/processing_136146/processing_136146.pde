
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(255);
  } else {
    fill(random(215),random(255),random(225));
  }
  ellipse(mouseX, mouseY, 80, 80);
}
