
void setup() {
  size(300, 300);
  background(0);
  strokeWeight(6);
}

void draw() {
  //This controls the red rectangle.
  if (mouseX < width*.25) {
    fill(255, 0, 0);
    rect(0, 0, width/4, height);
  }

  //This controls the yellow rectangle.
  if (mouseY < height*.25) {
    fill(255, 255, 0);
    rect(0, 0, width, height*.25);
  }

  //This controls the blue rectangle.
  if (mouseX > width*.75) {
    fill(0, 0, 255);
    rect(width*.75, 0, width*.25, height);
  }

  //This controls the white rectangle.
  if (mouseY > height*.75) {
    fill(255);
    rect(0, height*.75, width, height*.25);
  }
}


