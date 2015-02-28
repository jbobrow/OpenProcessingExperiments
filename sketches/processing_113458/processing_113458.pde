
float ballX;
float ballY;
float ballXSpeed = 2;
float ballYSpeed = -4;

void setup(){
  size(500,200);
}
void draw(){
  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;
  
  fill(ballX, ballX, ballY);
 
  ellipse(ballX, ballY, 15, 15);
  noStroke();
  
  if (ballX > width){
    ballXSpeed = ballXSpeed * -1;
    }
  if (ballX < 0){
    ballXSpeed = ballXSpeed * -1;
    }
  
  if (ballY > height){
    ballYSpeed = ballYSpeed * -1;
  }
  if (ballY < 0){
    ballYSpeed = ballYSpeed * -1;
}
}
