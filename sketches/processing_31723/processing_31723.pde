
void setup() {
    size(800, 800);
    smooth();
}

void draw() {
    if (mousePressed) {
      fill(0);
    } else {
      fill(500);
    }
    ellipse(mouseX, mouseY, 80, 80);
}

