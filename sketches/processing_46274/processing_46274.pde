
int farve = 0;
int circleSize = 5;
int movingUp = 1;

void setup() {
  size(800, 800);
  smooth();
  background(255);
  colorMode(HSB);
}

void mouseMoved() {
  if (movingUp == 1) {
    circleSize = circleSize + 1;
    if (circleSize > 100) {
      movingUp = 0;
    }
  } 
  else {
    circleSize = circleSize - 1;
    if (circleSize < 5) {
      movingUp = 1;
    }
  }
}

void draw() {
  fill(farve, 255, 255);
  ellipse(mouseX, mouseY, circleSize, circleSize);
  ellipse(width - mouseX, mouseY, circleSize, circleSize);
  ellipse(mouseX, height - mouseY, circleSize, circleSize);
  ellipse(width - mouseX, height - mouseY, circleSize, circleSize);
  farve = (farve + 1) % 256;
}


