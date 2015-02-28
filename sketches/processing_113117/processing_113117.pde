
// mouse interaction
// schien

void setup() {
  size(480, 120);
  smooth();
  strokeWeight(0.5);
}
void draw() {
  if (mousePressed) {
    fill(0);
  } 
  else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}



