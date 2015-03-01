
int ballX;
int ballY;
int ballSpeedX = -5;
int ballSpeedY = -5;
int paddleHeight = 20;
int paddleColor;

void setup() {
  size(800, 600);
  background(0);
  noCursor();

}

void draw() {
  background(0);
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
}

void moveBall() {
  ballX = ballX + ballSpeedX;
  ballY = ballY + ballSpeedY;
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);
  
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1;
  }
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1;
  }
  if (ballY > height-paddleHeight) {
    if (ballX > mouseX && ballX < mouseX + 250) {
      ballSpeedY = ballSpeedY * -1;
    } else {
      text("GAME OVER!", width/2, height/2);
      noLoop();
      
    }
  }
}
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 60, 60);
}
 
void drawPaddle() {
  stroke(paddleColor); // color of paddle border
  strokeWeight(6); // border thickness of 4px
  
  // y-value is always at the bottom, minus height of paddle, minus border of paddle
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
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
void mouseClicked()//if space bar is clicked the gamereset
{
  if( !playing)
  {   
    setup(); // to 
    playing = true;
  }
}

