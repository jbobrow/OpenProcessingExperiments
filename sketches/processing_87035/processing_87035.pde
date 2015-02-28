
void setup() {
  background(194,180,234);
  size(780,320);
}

void draw() {
  if (mousePressed) {
    fill (255, 122, 66);
  rect (mouseX, mouseY, 86, 86);
  } else {
    fill(230, 101, 166);
    ellipse (mouseX, mouseY, 86, 86);
  }
}


