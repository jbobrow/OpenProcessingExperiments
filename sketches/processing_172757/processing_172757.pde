
// global variables, able to be used in all functions
int ballX;              // x-location of the ball
int ballY;              // y-location of the ball
int ballSpeedX = 5;     // speed of the ball horizontally
int ballSpeedY = 5;     // speed of the ball vertically
int paddleHeight = 30;  // height of the paddle
int paddleColor;        // color of the paddle
 
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
  if (ballY > height-paddleHeight) { // past 'goal line'
    if (ballX > mouseX && ballX < mouseX + 200) { // within paddle
      ballSpeedY = ballSpeedY * -1; // switch Y direction
      ballSpeedY = ballSpeedY -1;
    } else { // end game
      text("GAME OVER!", width/2, height/2);
      noLoop();
    }
  }
}
 
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 40, 40);
}
 
void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(5); // border thickness of 5px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
  rect(0,120,40,100);
  rect(757,30,40,100);

}
 
void mousePressed() {
  // takes the values of mouseX between 0 and width and scales between 0-255
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}
 
void keyPressed() {
  // changes ball/paddle to black/white
    if (key == 'j' || key == 's') {
    fill(204,153,255);
  }
  if (key == 'm' || key == 'c') {
    fill(100,183,173);
  }
}

