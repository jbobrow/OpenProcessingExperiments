
PImage nbc;

int signal=20000;
float circleX[] = new float[signal];
float circleY[] = new float[signal];
float velX[] = new float [signal];
float velY[] = new float [signal];

void setup() {
  size(800, 500);
  nbc = loadImage("nbc.png");
  smooth();
  noStroke();
  fill(180, 180, 180, 100);
  for (int i=0; i<signal; i++) {
  circleX[i] = random(10, width-10);
  circleY[i] = 50;
  velX[i] = random(100);
  velY[i] = random(100);
  }
}

void draw() {

  background (0);
  for (int i=0; i<signal; i++) {

  circleX[i] = circleX[i] +velX[i];
  circleY[i] = circleY[i] +velY[i];

    if ((circleX[i] <= 10)||(circleX[i]>=width-10)) {
      velX[i] = velX[i] * -1;
    }

    if (circleY[i] <= 10) {
      velY[i] = velY[i] * -1;
    }

    if (circleY[i]>=height-10) {
      velY[i] = velY[i] * -0.95;
    }
    ellipse(circleX[i], circleY[i], 5, 5);
  }
}

void mousePressed() {
  image(nbc, 0, 0, 800, 500);
}



