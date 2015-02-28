
int numCircle = 150;

float[] circleX = new float [numCircle];
float [] circleY = new float [numCircle];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  colorMode(RGB, 256);

  for (int i = 0; i < numCircle; i++) {
    circleX[i] = random(width);
    circleY[i] = random(height);
  }
}

void draw() {
  background(255, 255, 180);
  fill(80, 105, 180, 200);
  for (int i = 0; i < numCircle; i++) {
    ellipse(+circleX[i], circleY[i], i/4+mouseX/10, i/2+mouseY/10);
  }
}


