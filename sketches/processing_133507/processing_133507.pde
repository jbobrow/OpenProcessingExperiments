
void setup() {
  size(500, 500);
}
 fill(random(255),random(255),35);
void draw() {
  if (mousePressed) {
    fill(random(255),random(255),random(255));
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 50, 50);
}
