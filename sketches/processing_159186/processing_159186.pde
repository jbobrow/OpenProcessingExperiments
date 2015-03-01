
int xOffset, num, rot;

void setup() {
  size(500, 500);
  xOffset = 0;
  num = 10;
  rot = 0;
  background(0);
  smooth();
}

void draw() {
  noStroke();
  background(0);
  xOffset += 1;
  rot++;

  pushMatrix();
  translate(width * .5, height * .5);
  rotate(radians(rot));
  for (int i = 0; i < num; i++) {
    pushMatrix();
    rotate(radians(360/num * i));
    fill(255);
    ellipse(xOffset, 0, 20, 20);
    if (xOffset > width * .7) {
      xOffset = 0;
    }
    popMatrix();
  }
  popMatrix();
}

