
// The Minimal Drawing Board
void setup() {
  size(640, 400);
  background(0);
}
void draw() {
  point(mouseX, mouseY);
  mousePressed ? stroke(230,250,120) : stroke(60,180,255);
}
