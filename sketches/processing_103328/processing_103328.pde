
void setup() {
  size(100, 100);
  background(0);
  text("Click This!", 10, 15);
}

int stage = 0;

void draw() {
}
void mousePressed() {
  if (stage == 0) {
    stage = 1;
    background(255);
    fill(255, 0, 0);
    ellipse(50, 50, 70, 70);
    fill(0);
    text("Click This!", 10, 15);
  } else if (stage == 1) {
    stage = 2;
    background(255);
    fill(255, 255, 0);
    ellipse(50, 50, 70, 70);
    fill(0);
    text("Click This!", 10, 15);
  } else if (stage == 2) {
    stage = 3;
    background(255);
    fill(0, 255, 0);
    ellipse(50, 50, 70, 70);
    fill(0);
    text("Click This!", 10, 15);
  } else if (stage == 3) {
    stage = 0;
    background(0);
    fill(255);
    text("Click This!", 10, 15);
  }
}


