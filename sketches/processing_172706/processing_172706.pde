
int ballX; 
int ballY; 
int ballSpeedX = 5; //speed of the ball that will allow the ball to move off the x-axis
int ballSpeedY = 5; //speed of the ball that will allow the ball to move off the y-axis
int paddleHeight = 30; //indicates the 
int paddleColor; //shows color of the paddle

void setup() {
  size(800, 600); //the screen size
  noCursor(); //no cursor will be shown on the background
  ballX = width/2; //the size of the ball
  ballY = height/2; //height of the ball 
}

void draw() {
  background(128); //the color of the screen
  moveBall(); //makes the ball move around the screen (bouncing)
  checkCollide(); //prevents the ball from colliding the walls or other 
  drawPaddle(); //the structure of the box that makes the ball bounce off of
  drawBall(); //the shape of ball (structure) 
}

void moveBall() {
  ballX = ballX + ballSpeedX; //move the ball off the x-axis
  ballY = ballY + ballSpeedY; //move the ball off the y-axis
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); //states how fast the ball is moving
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; //reverse the speed of the ball off the x-axis
 }
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; //reverse the speed of the ball off the y-axis
  }
  if (ballY > height-paddleHeight) {
    if (ballX > mouseX && ballX < mouseX + 200) {
      ballSpeedY = ballSpeedY * -1; //reverse the speed/ direction of the bouncing ball
    } else {
      text("GAME OVER!", width/2, height/2); //shows the text when the player lost
      noLoop(); //the code stops
    }
  }
}

void drawBall() {
  noStroke(); //no marks left behind
  ellipse(ballX, ballY, 20, 20); //circle size
}

void drawPaddle() {
  stroke(paddleColor); //color
  strokeWeight(4); //the color of the stroke
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); //shape of the paddle
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}

void keyPressed() {
  if (key == 'b' || key == 'B') { //press a certain key (b and B)
    fill(0); //color black
  }
  if (key == 'w' || key == 'W') { //press a certain key (w and W)
    fill(255); //color white
  }
}




