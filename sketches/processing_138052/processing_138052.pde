
void setup() {
  size(500, 400);
  background(0);
}

void draw() {
  {
  if(mousePressed) {
    stroke(175, 0, 122);
    fill(230, 216, 10);
  } else {
    stroke:
    fill(230, 10, 10);
  }
  ellipse(mouseX, mouseY, 40, 40);
  }
 {
  if(mousePressed) {
    stroke(249, 76, 33);
    fill(74, 123, 255);
  } else {
    stroke(0, 5, 135);
    fill(7, 210, 0);
  }
  ellipse(mouseY, mouseX, 40, 40);
}
}


