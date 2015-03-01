


// global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int paddleColor;        // color of the paddle
float paddleWidth=200;
void setup() {
  size(800, 600);   // canvas size
  noCursor();       // hides the mouse
  ballX = width/2;  // start the ball in the
  ballY = height/2; //   middle of the canvas
}
 
void draw() {
  background(128); // resets the background
  moveBall();      // ball moves in X and Y directions
  checkCollide();  // checks for collision with walls or paddle
  drawPaddle();    // re-draws paddle
  drawBall();      // re-draws ball 
  
}
 
void moveBall() {
  ballX = ballX + ballSpeedX; // updates ball location horizontally
  ballY = ballY + ballSpeedY; // updates ball location vertically
  
  // monitor speed/direction of ball
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); 
}
 void mousePressed(){
   paddleWidth = paddleWidth - random(0,200);
}

void checkCollide() {
  // left/right edge
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; // switch X direction
     ballSpeedY = ballSpeedY -1;// increases speed when it hits left/right border
    
  }
  
  // top edge
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // switch Y direction
    ballSpeedY = ballSpeedY + 1; // increases speed when hits top border
  }
  
  // paddle
  if (ballY > height-paddleHeight) { // past 'goal line'
    if (ballX > mouseX && ballX < mouseX + paddleWidth ) { // within paddle
      ballSpeedY = ballSpeedY * -1; // switch Y direction
      ballSpeedY = ballSpeedY - 1;
    } else { // end game
      text("GAME OVER!", width/2, height/2);
      noLoop();
    }
  }
}
 
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}
 
void drawPaddle() {
  stroke(random(255),random(255)<WBR>,random(255)); // color of paddle border
  strokeWeight(4); // border thickness of 4px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, paddleWidth, paddleHeight);
}
