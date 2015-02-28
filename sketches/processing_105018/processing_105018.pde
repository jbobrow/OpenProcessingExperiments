
void setup() {
  size(720, 560);
}
void draw() {
  strokeWeight(0);
  fill(random(255));
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX, mouseY, 0, 0);
}
