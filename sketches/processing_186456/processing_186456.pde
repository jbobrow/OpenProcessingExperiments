
void draw () {
  if (mouseX<80) {
    rect (20, 20, 10, 10);
    if (mouseX<25) {
      fill(0,0,89);

      rect(40, 20, 10, 10);
    }
  }
  else {
    fill(45, 0, 0);
    ellipse(20, 20, 10, 10);
  }
  if (mouseY<30) {
    rect (20, 20, 10, 10);
  }
  else {
    fill(12, 13, 14);
    ellipse(50, 50, 10, 10);
  }
  if (mouseX>50) {
    rect (20, 20, 10, 10);
  }
  else {
    ellipse(30, 30, 10, 10);
  }
}
