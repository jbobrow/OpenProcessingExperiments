
int ballX;// the movement
int ballY;// of the ball
int ballSpeedX = 5;
int ballSpeedY = -5;
int paddleHeight = 30;
int paddleColor;

void setup() {
  size(800, 600);
  noCursor(); //no mouse in the canvas.
  ballX = random(1,790);// starts the ball at 
  ballY = random(1,550);// the middle of the canvas.
}

void draw() {
  background(128);
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
   
  
}

void moveBall() {
  ballX = ballX + ballSpeedX; // move the ball left to right and increase the speed
  ballY = ballY + ballSpeedY; // move the ball up to down and increased the speed
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); // tells you at what speed your ball is going.
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {// when the ball is in x=0 and when it had go the entired x canvas from both side it has to bounces back.
   
    ballSpeedX = ballSpeedX * -1;// times the amount of speed that is going to a negative or positive so that it can goes back. 
    
  }
  if (ballY < 0) {// the ball has to bounce back when it y=0.
    ballSpeedY = ballSpeedY * -1; // times it so that it can change to positive or negative to bounce back.
 }
  if (ballY > height-paddleHeight) {// it tells exact up to where the ball have to go but touch the paddle to bounces.
    if (ballX > mouseX && ballX < mouseX + 300) {// it could bounce back only if it touches the top width of the paddle.
      ballSpeedY = ballSpeedY * -1;// to make the ball bounces back
    } else {
      text("GAME OVER!", width/2, height/2); // when it has past the high of the paddle but did not touch the top width of it, it states game over.
      noLoop();
    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);// the movement of the ball and how big it is
}

void drawPaddle() {
  stroke(paddleColor);
  strokeWeight(4);
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);// the paddle size and movement.
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));// changes the color when it press depending on the other things colors.
}

void keyPressed() {
// changes color when key are press.
  if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
}

