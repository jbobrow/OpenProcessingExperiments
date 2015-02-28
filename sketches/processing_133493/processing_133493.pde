
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(random(255),80,190,50);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
