
class Box {
  float x, y, z;
  color c;
  int alpha;
  float am = random(1, 10);

  Box(float tx, float ty, float tz) {
    x = tx;
    y = ty;
    c = color(random(50, 255), random(50, 255), random(50, 255));
    z=tz;
    alpha = (int)random(255);
  }

  void glow() {
    alpha +=am;
    if (alpha>255) alpha = 0;
  }

  void display() {
    pushMatrix();
    fill(c, alpha);
    translate(x, y, z);
    lights();
    stroke(255);
    box(30);
    popMatrix();
  }

  void mousePressed() {
    if (mouseX< 320) {
      if (mousePressed) {
        alpha=0;
      }
    }
    if (mouseX>320 && mouseX<680 && mouseY<height/2) {
      if (mousePressed) {
        am=0;
      }
    }
    if (mouseX>320 && mouseX<680 && mouseY>height/2) {
      if (mousePressed) {
        am=random(1, 10);
      }
    }
    if (mouseX>666) {
      if (mousePressed) {
        alpha=200;
      }
    }
  }
}


