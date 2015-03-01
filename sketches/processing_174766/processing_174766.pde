
PFont font; //font variable
 
// Ball shape
int ballSize = 12;
float ballX;
float ballY;
float ballSpeedX;
float ballSpeedY;
 

// Side Paddles
int paddleHeight = 50;
float paddleSpeedY = 3;
float paddleLeftPosY;
float paddleLeftSpeedY = 0;
float paddleRightPosY;
float paddleRightSpeedY = 0;
 
// Starting Score
int scoreLeft = 0;
int scoreRight = 0;
 
void setup() {
  size(480, 480);
  background(0);

 //Starting positions
  ballX = width/2;
  ballY = height/2;
  ballSpeedX = 3;
  ballSpeedY = 0;
  paddleLeftPosY = height/2-paddleHeight/2;
  paddleRightPosY = height/2-paddleHeight/2;
 
 
}
 
void draw() {
 
  
  if (ballX >= width || ballX <= 0 ) { //start over
    
    if ( ballX >= width ) { //keep track of score
      scoreLeft += 1;
    }
    else {
      scoreRight += 1;
    }
 
    // reset game to starting positions
    ballX =  width/2;
    ballY = height/2;
    ballSpeedY = 0;
    
  }
 
 
  //moving constantly
  noStroke();
  fill(0);
  rectMode(CORNER);
  rect(0, 0, width, height);
 
 
  // draw Score
  fill(255);
  textAlign(LEFT);
  text(scoreLeft, 50, 25);
  textAlign(RIGHT);
  text(scoreRight, 420, 25);
  fill(255);
  text("Tennis For Two", 310, 25);                      
  
 
 
  // draw Paddles
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(25, paddleLeftPosY, 1, paddleHeight);
  rect(width-25, paddleRightPosY, 1, paddleHeight);
 
  // Left Paddle Motion
  paddleLeftPosY += paddleLeftSpeedY;
  if (paddleLeftPosY < 25) {
    paddleLeftPosY = 25;
  }
  else if (paddleLeftPosY+paddleHeight > height-25) {
    paddleLeftPosY = height-25-paddleHeight;
  }
 
  // Right paddle motion
  paddleRightPosY += paddleRightSpeedY;
  if (paddleRightPosY < 25) {
    paddleRightPosY = 25;
  }
  else if (paddleRightPosY+paddleHeight > height-25) {
    paddleRightPosY = height-25-paddleHeight;
  }
 
 
  // Ball
  ballX += ballSpeedX;
  ballY += ballSpeedY;
 
  // Reflect off top and bottom boundaries 
  if ( ballY-ballSize/2 < 25 || ballY+ballSize/2 > height-25 ) {
    ballSpeedY *= -1;
  }
 
  // Reflect off Left Paddle
  if (ballX-ballSize/2 <= 25 && ballX+ballSize/2 > 25) {
    if (ballY >= paddleLeftPosY && ballY <= paddleLeftPosY+paddleHeight) {
      ballSpeedX *= -1;
      float hit = ballY - (paddleLeftPosY+paddleHeight/2);
      ballSpeedY += (hit / (paddleHeight/2)) *2; // range -1 to 1 (*2)
    }
  }
 
  // Reflect off Right Paddle 
  if (ballX+ballSize/2 >= width-25 && ballX-ballSize/2 < width-25) {
    if (ballY >= paddleRightPosY && ballY <= paddleRightPosY+paddleHeight) {
      ballSpeedX *= -1;
      float hit = ballY - (paddleRightPosY+paddleHeight/2);
      ballSpeedY += (hit / (paddleHeight/2)) *2; // range -1 to 1 (*2)
    }
  }
 
  // ball
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(ballX, ballY, ballSize, ballSize);
}
 
void keyPressed() {
  if (key == 'w' || key == 'W') {
    paddleLeftSpeedY = paddleSpeedY * -1;
  }
  else if (key == 's' || key == 'S') {
    paddleLeftSpeedY = paddleSpeedY;
  }
  else if (keyCode == UP) {
    paddleRightSpeedY = paddleSpeedY * -1;
  }
  else if (keyCode == DOWN) {
    paddleRightSpeedY = paddleSpeedY;
  }
}
 





