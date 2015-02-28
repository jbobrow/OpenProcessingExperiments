
int width = 400;
int height = 400;
int ballSize = 30;
int ballRadius = ballSize/2;
float xPos = random(ballRadius, width-ballRadius);
float yPos = random(ballRadius, height-ballRadius);
float speedX = 2.5;
float speedY = 2.5;

void setup() {
  frameRate(50);
  size(width, height);
  smooth();
}

void draw() {
  xPos = xPos + speedX;
  yPos = yPos + speedY;

  if (xPos >= width-ballRadius || xPos <= 0+ballRadius) {
    speedX *= -1;
  } 
  else if (yPos >= width-ballRadius || yPos <= 0+ballRadius) {
    speedY *= -1;
  }

  background(0);
  ellipse(xPos, yPos, ballSize, ballSize);
}

