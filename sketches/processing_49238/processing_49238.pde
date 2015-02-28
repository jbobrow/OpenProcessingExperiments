
int r = 50;
float x, y;
float easing = 0.1;

void setup() {
  size(640, 480);
  frameRate(30);
  smooth();
}

void draw() {
  background(0);
  
  float targetX = mouseX;
  float targetY = mouseY;
  float dx = targetX - x;
  float dy = targetY - y;
  
  if (abs(dx) > 1) {
    x += dx * easing;
  }
  if (abs(dy) > 1) {
    y += dy * easing;
  }
  
  fill(255);
  ellipse(x, y, r*2, r*2);
}

