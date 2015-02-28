
int ballX;
int ballY;

int speedBallX = 5;
int speedBallY = 6;

int directBallX = -1;
int directBallY = -1;

void setup() {
  size(500, 500);  
  fill(255, 255, 0);
  noStroke();
  ballX = 250;
  ballY = 250;
}

void draw() {
  background(255);

  ellipse(ballX, ballY, 20, 20);
  ballX = ballX + speedBallX;
  ballY = ballY + speedBallY;

  if (ballX >=500 || ballX <=0) {
    speedBallX = speedBallX*directBallX;
  }
  
  if(ballY >=500 || ballY <=0){
    speedBallY = speedBallY*directBallY;
  }
}  


