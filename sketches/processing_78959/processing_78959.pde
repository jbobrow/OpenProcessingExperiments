
void setup() {
  size(650, 1200);
  smooth();
  text ("My name is Alex Seto", 430, 600);
}

void draw() {
  if (mousePressed) {
    fill (0);
  } else {
    fill (255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}


