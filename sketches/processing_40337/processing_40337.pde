
//Move mouse


void setup() {
  size(450, 450);
  background(0);
  stroke(255, 200, 0);
  strokeWeight(.2);
  smooth();
}

void draw() {
  for (int i = 0; i < 450; i = i + 20) {
    line(225, i, mouseX + 15, i);
    line(mouseX + 5, i, 300, i);

    if (mouseX > 0) {
      line(225, 225, mouseX, i);
      line(mouseX, i, 0, i);
    }
  }
}


