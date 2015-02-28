
//4
void setup() {
  size(500, 500);
}
void draw() {
  if (mousePressed) {
    if (mouseButton == LEFT) {
      stroke(0, 200, 100);
      fill(0, 100, 50);
      ellipse(mouseX, mouseY, 100, 100);
    } 
    else if (mouseButton == RIGHT) {
      stroke(0, 50, 100);
      fill(0, 100, 200);
      rect(mouseX, mouseY, 50, 50);
    }
  }
  else {
    stroke(255, 0, 0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}



