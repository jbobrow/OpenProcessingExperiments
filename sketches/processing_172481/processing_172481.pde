
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int paddleColor;        // color of the paddle
int paddleWidth = 30;
int paddleMovement = 0;

void setup() {
  size(800, 600);   // canvas size
  noCursor();       // hides the mouse
  ballX = 400;  // start the ball in the
  ballY = 0; //   middle of the canvas
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
 
void checkCollide() {
  // left/right edge
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; // switch X direction
  }
  
  // top edge
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // switch Y direction
  }
  
  // paddle
  if (ballX > width-paddleWidth){
  if(ballX > mouseX && ballX < mouseX + 100)
  ballSpeedY = ballSpeedY *-1;
       else { // end game
      text("GAME OVER!", width/2, height/2);
      text("200",400,200);
     noLoop();
    } 
  }


  if (ballY > height-paddleHeight) {
     ballSpeedY = ballSpeedY * -1;
    }
 
  
}
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}
 
void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(4); // border thickness of 4px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(width-paddleWidth-4,mouseY,paddleWidth,50);
  rect(paddleMovement,mouseY,paddleWidth,50);
}
 
void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}
 
void keyPressed() {
  // changes ball/paddle to black/white
    if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
}
