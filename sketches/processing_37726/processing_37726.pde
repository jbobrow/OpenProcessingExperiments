
float ballX = 350;
float ballY = 200;
int speed = 1;
float g = 1;


void setup () {
  size(700,400);
}

void draw() {

  background(255);

  ellipse(ballX, ballY, 55, 55);
  ballY += speed;

  if (ballY < height-27 ) {
    speed += g;
  }
  else if ( ballY >= height-27) {
    speed = -speed;
  }
  if (speed < 0) {
    g = 1.2;
  }
  else {
    g = 1;
  }
}


