
void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  if (mouseX>width/2) {
    fill(#00ff00);
    stroke(#0000ff);
    line(mouseX, mouseY, 20, 20);
  }
    if (mouseX<width/2) {
    stroke(#00ff00);
    line(mouseX, mouseY, 20, 20);
  }
}
