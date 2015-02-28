
void draw() {
  if (mousePressed == true) {
    fill(255,0,0);
    strokeWeight(1);
  } else {
    fill(0,255,0);
    strokeWeight(10);
  }
  ellipse(50, 50, 60, 60);
}
