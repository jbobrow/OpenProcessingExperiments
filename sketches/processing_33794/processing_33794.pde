
float ballx = 10;
float bally = 10;
float ballw = 5;
float speedx = 7;
float speedy = 5;

void setup() {
  size (300, 300);
//  background (0, 255, 0);
  noStroke();
}

void draw() {
  background (0, 255, 0);
  ellipse (ballx, bally, ballw, ballw);
  moveBall();

  checkEdgeOfScreen();
}

void moveBall() {
  bally += speedy;
  ballx += speedx;
}

void checkEdgeOfScreen() {
  if ((ballx > width - (ballw/2)) || ((ballx < 0 + ballw/2))) {
    speedx = speedx * -1;
  }
  if ((bally > height - (ballw/2)) || (bally < 0 + (bally/2))) {
    speedy = speedy * -1;
  }
}


