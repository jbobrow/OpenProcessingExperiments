
void setup() {
  size(640, 360);
  background(250, 211, 182);
}

void draw() {
  if (mousePressed) {
    stroke(234, 228, 40);
    fill(84, 131, 224);
    ellipse(mouseX, mouseY, mouseX-5, mouseY-5);
  } else {
    fill(234, 228, 40);
  stroke(84, 131, 224);
  triangle(mouseX-50, mouseY+50, mouseX, mouseY-50, mouseX+50, mouseY+50);
}
}


