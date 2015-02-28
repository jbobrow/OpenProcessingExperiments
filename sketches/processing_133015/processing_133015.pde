
void setup() {
  size(640, 500);
  noSmooth();
  fill(126);
  background(350);
}

void draw() {
  if (mousePressed) {
    stroke(325);
  } else {
    stroke(0);
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
}
