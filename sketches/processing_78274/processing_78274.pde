
//drawing a line with the mouse

void setup() {
  size(800,600);
  background(255);
}

void draw() {
  stroke(0);
  mouseline();
}

void mouseline() {
  if (mousePressed==true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

