
int ballX = 50;
int ballY = 50;
int ball2X = 150;
int ball2Y = 50;
int ball3X = 150;
int ball3Y = 150;
int ball4X = 50;
int ball4Y = 150;

int Xspeed = 2;
int Yspeed = 2;

int ballXDirection = 1;
int ballYDirection = 0;
int ball2XDirection = 0;
int ball2YDirection = 1;
int ball3XDirection = -1;
int ball3YDirection = 0;
int ball4XDirection = 0;
int ball4YDirection = -1;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
}

void draw() {
  background(0);

  
  fill(255, 0, 0);
  ellipse(ballX, ballY, 20, 20);
  fill(0, 0, 255);
  ellipse(ball2X, ball2Y, 20, 20);
  fill(0, 255, 0);
  ellipse(ball3X, ball3Y, 20, 20);
  fill(#FCFC00);
  ellipse(ball4X, ball4Y, 20, 20);

  fill(255, 0, 0);
  ellipse(ballX, ball4Y, 20 ,20);
  ellipse(ballX, ball3Y, 20 ,20);
  ellipse(ballX, ball2Y, 20 ,20);
  fill(0, 0, 255);
  ellipse(ball2X, ball4Y, 20 ,20);
  ellipse(ball2X, ball3Y, 20 ,20);
  ellipse(ball2X, ballY, 20 ,20);
  fill(0, 255, 0);
  ellipse(ball3X, ball4Y, 20 ,20);
  ellipse(ball3X, ballY, 20 ,20);
  ellipse(ball3X, ball2Y, 20 ,20);
  fill(#FCFC00);
  ellipse(ball4X, ballY, 20 ,20);
  ellipse(ball4X, ball3Y, 20 ,20);
  ellipse(ball4X, ball2Y, 20 ,20);
  
  
  ballX = ballX + (Xspeed * ballXDirection);
  ballY = ballY + (Yspeed * ballYDirection);
  if(ballX == 150 && ballY == 50) {
    ballXDirection = 0;
    ballYDirection = 1;
  } else if(ballY == 150 && ballX == 150) {
    ballYDirection = 0;
    ballXDirection = -1;
  } else if(ballX == 50 && ballY == 150) {
    ballXDirection = 0;
    ballYDirection = -1;
  } else if(ballY == 50 && ballX == 50) {
    ballYDirection = 0;
    ballXDirection = 1;
  }
  
  ball2X = ball2X + (Xspeed * ball2XDirection);
  ball2Y = ball2Y + (Yspeed * ball2YDirection);
  if(ball2X == 150 && ball2Y == 50) {
    ball2XDirection = 0;
    ball2YDirection = 1;
  } else if(ball2Y == 150 && ball2X == 150) {
    ball2YDirection = 0;
    ball2XDirection = -1;
  } else if(ball2X == 50 && ball2Y == 150) {
    ball2XDirection = 0;
    ball2YDirection = -1;
  } else if(ball2Y == 50 && ball2X == 50) {
    ball2YDirection = 0;
    ball2XDirection = 1;
  }
  
  ball3X = ball3X + (Xspeed * ball3XDirection);
  ball3Y = ball3Y + (Yspeed * ball3YDirection);
  if(ball3X == 150 && ball3Y == 50) {
    ball3XDirection = 0;
    ball3YDirection = 1;
  } else if(ball3Y == 150 && ball3X == 150) {
    ball3YDirection = 0;
    ball3XDirection = -1;
  } else if(ball3X == 50 && ball3Y == 150) {
    ball3XDirection = 0;
    ball3YDirection = -1;
  } else if(ball3Y == 50 && ball3X == 50) {
    ball3YDirection = 0;
    ball3XDirection = 1;
  }
  
  ball4X = ball4X + (Xspeed * ball4XDirection);
  ball4Y = ball4Y + (Yspeed * ball4YDirection);
  if(ball4X == 150 && ball4Y == 50) {
    ball4XDirection = 0;
    ball4YDirection = 1;
  } else if(ball4Y == 150 && ball4X == 150) {
    ball4YDirection = 0;
    ball4XDirection = -1;
  } else if(ball4X == 50 && ball4Y == 150) {
    ball4XDirection = 0;
    ball4YDirection = -1;
  } else if(ball4Y == 50 && ball4X == 50) {
    ball4YDirection = 0;
    ball4XDirection = 1;
  }
}

