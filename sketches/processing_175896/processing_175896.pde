
void setup() {
  size(480, 480);
}

void draw() {
  if (mousePressed) {
    fill(100,120,200);
  } else {
    fill(255,0,255);
  }
  triangle(mouseX, mouseY, 80,50,90,80);
}

