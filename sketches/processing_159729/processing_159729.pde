
int minDiam = 10;
int maxDiam = 100;
int diam;
int inc = 2;

void setup() {
  size(640, 480);
  diam = minDiam;
}

void draw() {
}

void mouseDragged() {
  ellipse(mouseX, mouseY, diam, diam);
  diam += inc;
  if (diam > maxDiam || diam < minDiam) {
    inc = -inc;
  }
}



