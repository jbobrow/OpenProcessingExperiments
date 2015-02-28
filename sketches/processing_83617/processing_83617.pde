


void setup() {

  size(600, 400);
  background(0, 0, 255);
}

void draw() {

  if (mousePressed) {
    stroke(0);
    //draw a circle at the mouse position
    ellipse(mouseX, mouseY, 50, 50);
  }
}



