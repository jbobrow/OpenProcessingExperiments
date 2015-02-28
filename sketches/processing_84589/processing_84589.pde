
void setup() {
  size (400, 400);
  noFill();
}

void draw() {
  if (mousePressed == true){
  stroke (200, 0, 50);
} else {
  stroke (50, 0, 200);
  }
  ellipse (mouseX, mouseY, 5, 5);
}
