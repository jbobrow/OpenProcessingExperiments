
void setup() {
  size(120, 300);
  background(204);
  smooth();
  ellipse(60, 50, 80, 80);
  ellipse(60, 150, 80, 80);
  ellipse(60, 250, 80, 80);
}
void draw() {
  if (keyPressed) {
    if ((key == 'r')) {
      fill(255, 0, 0);
    }
    else {
      fill(255);
    }
    ellipse(60, 50, 80, 80);
  }
  if ((key == 'y')) {
    fill(247,247,40);
  }
  else {
    fill(255);
  }
  ellipse(60, 150, 80, 80);
  if ((key == 'g')) {
    fill(0, 255, 0);
  }
  else {
    fill(255);
  }
  ellipse(60, 250, 80, 80);
}



