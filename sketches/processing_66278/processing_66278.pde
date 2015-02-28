
int ballX;
int ballY;
int speedBallX;
int speedBallY;

void setup() {

  size (400, 400);
  smooth();

  ballX = width/2;
  ballY = height/2;
  speedBallX = 4;
  speedBallY = 4;
}

void draw() {
  
  background(150, 0, 0);
  noStroke();
  fill(0, 0, 100);
  ellipse (ballX, ballY, 20, 20);
  
  ballX = ballX + speedBallX;
  ballY = ballY + speedBallY;
  
   if (ballX > width || ballX < 0){
   speedBallX *= -1;
  }
   
  if (ballY > height || ballY < 0){
   speedBallY *= -1;
  }


}


