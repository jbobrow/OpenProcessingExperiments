
void setup() {
  size (400, 400);
  smooth();
  fill(244, 252, 178);
  rect(0, 0, width, height);
}

void draw() {
  noStroke();

  if (mousePressed && (mouseButton == LEFT)) {

    stroke(203, 133, 115);
    strokeWeight(5);
 line(mouseX, mouseY, pmouseX, pmouseY);
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    fill(244, 252, 178, 100);
    rect(0, 0, width, height);
  }
}

