
float startSize = 200;
float angle1, angle2;

void setup() {
  size(800, 500);
  stroke(255);
  fill(255);
  noSmooth();
}

void draw() {
  background(0);

  //asthetic design
  rect(0, height / 2 + startSize, width, height);
  translate(width / 2, height / 2 + startSize);

  angle1 = map(mouseY, 0, height, 0, PI); //angle between branches
  angle2 = map(mouseX, 0, width, -HALF_PI, HALF_PI);  //angle of center branch from center

  drawFractal(startSize);
}

void drawFractal(float lineSize) {
  if (lineSize > 1) {

    //rotates only branches after initial "trunk"
    if (lineSize != startSize) {
      rotate(angle2);
    }

    translate(0, -lineSize);
    line(0, 0, 0, lineSize);

    rotate(-angle1);

    for (int i = 0; i < 3; i++) {
      pushMatrix();
      drawFractal(lineSize / 2);
      popMatrix();
      rotate(angle1);
    }
  }
}



