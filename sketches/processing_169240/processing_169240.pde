
PImage unicorn;

void setup() {
  size(480, 480);
  background(204, 255, 255);
  unicorn = loadImage("laDefense.jpg");
  cursor(unicorn);
}

void draw() {
  if (mousePressed) {
    fill(204, 102, 0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 90);
}
