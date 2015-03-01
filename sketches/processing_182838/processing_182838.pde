
void setup() {
  size(500, 500);
  for (int i=0; i<width; i++) {
    stroke(i, i, 255, 100);
    line(i, 0, i, height);
    stroke(0, 255, i, 100);
    line(i+1, 0, i+1, height);
  }
}

void draw() {
  if (mousePressed) {
    noStroke();
    fill(255, 20);
    ellipse(mouseX, mouseY, 25, 25);
  }
}



