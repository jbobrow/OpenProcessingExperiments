
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  rectMode(CORNER);
  noStroke();
  fill(230, 30);
  rect(0, 0, width, height);

  pushMatrix();
  rectMode(CENTER);
  translate(250, 250);
  stroke(0);
  ellipse(0, 0, 85, 85);
  rotate(millis()/700.0);
  stroke(250, 150, 0);
  triangle(0, 100, 50, 0, 100, 100);
  triangle(0, -100, -50, 0, -100, -100);
  popMatrix();
  if (mousePressed) {
    filter(ERODE);
  }
  if (keyPressed) {
    filter(BLUR, 1);
  }
}

