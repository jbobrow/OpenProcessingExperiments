
void setup() {
  size(500,400);
  background(0,0,255);
}
void draw() {
  stroke(255);
  fill(mouseX,mouseY,128);
  ellipse(mouseX, mouseY, 100, 100);
}
