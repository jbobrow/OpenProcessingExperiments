
void setup() {
  size (400, 400);
  noStroke();
  fill (200, 20, 50, 120);
}

void draw() {
  if (mousePressed == true){
  ellipse (mouseX, mouseY, 8, 8);
} else {
  rectMode (CENTER);
  rect (mouseX, mouseY, 8, 8);
  }
}
