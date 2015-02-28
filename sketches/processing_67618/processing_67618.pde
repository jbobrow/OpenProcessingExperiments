
void setup() {
  size(600, 600);
  background(0);
  fill(255);
  smooth();
  rectMode(CENTER);
}
void draw() {
  noStroke();
  rect(mouseX, mouseY, 10, 10);
  if (mouseX < 101) {
    fill(200, 0, 0);
  }
  if (mouseX > 100) {
    fill(252, 173, 25);
  }
  if (mouseX > 200) {
    fill (220,200,0);
  }
  if (mouseX > 300) {
    fill (0,200,0);
  }
  if (mouseX > 400) {
    fill (25,230,250);
  }
  if (mouseX > 500) {
    fill (200,0,250);
  }
}


