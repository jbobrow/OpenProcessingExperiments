
int ballX;
int ballY;
int speedBallX;
int speedBallY;
int ballA;
int ballB;
int speedBallA;
int speedBallB;

void setup() {

  size (400, 400);
  smooth();

  ballX = 200;
  ballY = 0;
  speedBallX = 5;
  speedBallY = 5;
  
  ballA = 0;
  ballB = 200;
  speedBallA = 5;
  speedBallB = 5;
}

void draw() {
  
  background(255);
  noStroke();
  fill(100, 0, 100, 70);
  ellipse (ballX, ballY, 50, 50);
  fill(0, 100, 100, 70);
  ellipse (ballA, ballB, 50, 50);
  
  ballX = ballX + speedBallX;
  ballY = ballY + speedBallY;
  ballA = ballA + speedBallA;
  ballB = ballB + speedBallB;
  
   if (ballX > width || ballX < 0){
   speedBallX *= -1;
  }
   
  if (ballY > height || ballY < 0){
   speedBallY *= -1;
  }
  
   if (ballA > width || ballA < 0){
   speedBallA *= -1;
  }
   
  if (ballB > height || ballB < 0){
   speedBallB *= -1;
  }


}




