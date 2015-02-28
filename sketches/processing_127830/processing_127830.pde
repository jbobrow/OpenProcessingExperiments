
void setup() {
  size(1000, 800);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(154,200);
  } else{
    fill(48,95);
  }
  ellipse(mouseX, mouseY, 80, 80);
}


