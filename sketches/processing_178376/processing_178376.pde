
void setup() {
  size(1000, 1000);
}

void draw() {
  if (mousePressed) {
    fill(255,100,255);
  } else {
    fill(0,0,255);
  }
  random(rect(mouseY, mouseX, 50, 50),triangle(mouseX, mouseY, 50, 80, 80, 80, 50),triangle(mouseY, mouseX, 50, 80, 80, 80, 50),ellipse(mouseX, mouseY, 50, 50));
}
