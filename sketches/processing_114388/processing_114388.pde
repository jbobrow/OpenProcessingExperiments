
float ballX = 0;
float ballY = 0;
float speedX = 1;
float speedY = 2;
int score = 0;
int miss = 0;

void setup() {
  size(600, 400);
  smooth();
}

void draw() { 
  ballX = ballX + speedX;
  ballY = ballY + speedY;
  background(0, 9);

  float paddle = 100;
  if (ballX <= 0 || ballX > width) speedX = -speedX;
  if (ballY <= 0 || ballY > height) {
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if (distance < paddle) score = score +1;
    else miss = miss + 1;
  } 

  ellipse(ballX, ballY, 50, 50);
  rect( mouseX, height-25, 100, 25);

  fill(255);
  text("score:", +score, 10, 30);
  text("miss:", +miss, 40, 50);
}



