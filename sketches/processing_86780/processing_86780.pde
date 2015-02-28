
int counter;

void setup() {
  smooth();
  size(510, 510);
  background(#000000);
  noFill();
}

void draw() {
  if (mousePressed) {
    stroke(mouseX/2);
    ellipse(mouseX, mouseY, random(10,90), random(10,90));
  }
}
