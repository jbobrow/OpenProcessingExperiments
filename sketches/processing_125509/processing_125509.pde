
float x = 0;
float y = 0;

void setup() {
  size(400, 400);
}

void draw () {
  background(#FFEC5D);
  

  for (int i=0; i<10; i++) {
    pushMatrix();
    for (int j=0; j<6; j++) {
      float w = i / 4;

      fill(#09ADB4);
      ellipse(x, y, 1000, 700);

      x = (mouseX - x) * 1 + x;
      y = (mouseY - y) * 1 + y;

      rotate(radians(100));
      translate(20, 20);
    }
    popMatrix();
    translate(10, 5);
  }
}

