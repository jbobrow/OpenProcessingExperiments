
void setup() {
  size(500, 500);
  smooth();
}

void draw()  {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 50, 50);
}

