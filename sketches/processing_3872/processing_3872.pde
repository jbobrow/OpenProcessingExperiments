


int angle = 40;
void setup() {
  size(900, 900);
  background(0);
  smooth();
  noStroke();
 
}

void draw() {
  if (mousePressed == true) {
    angle += 30;
    float val = cos(radians(angle)) * 10.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(mouseY, mouseX, 240);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(mouseY, mouseX, 240);
    ellipse(mouseX, mouseY, 5,5);
  }
}

