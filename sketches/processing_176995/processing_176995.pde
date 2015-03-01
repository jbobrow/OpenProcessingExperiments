
int angle = 8;

void setup() {
  size(640, 360);
  background(48, 48, 171);
  noStroke();
  fill(67, 188, 188);
}

void draw() {
  //
  if (mousePressed == true) {
    angle += 5;
    float val = cos(radians(angle)) * 12.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(0);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(255);
    ellipse(mouseX, mouseY, 2, 2);
  }
}

