
int ballX;
int ballY;
int ballX2;
int ballY2;
int ballSpeedX = 5;
int ballSpeedY = 5;
int paddleHeight = 30;
int paddleHeight2 = 30;
int paddleColor;

void setup() {
  size(800, 600);
  noCursor();
  ballX = width/2;
  ballY = height/2;
}

void draw() {
  background(128);
  moveBall();
  checkCollide(); 
  drawPaddle();
  drawBall();
}

void moveBall() {
  ballX = ballX + ballSpeedX; // Increases ball speed horizontally
  ballY = ballY + ballSpeedY; // Increases ball speed vertically.
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); // Prints the speed of the ball.
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {
    ballSpeedX = ballSpeedX * -1; // Once the ball reaches 0 on X-Axis it bounces off X-Axis
  }
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1; // Once the ball reaches 0 on Y-Axis it bounces off Y-Axis
  }
  if (ballY > height-paddleHeight) {
    if (ballX > mouseX && ballX < mouseX + 200) {
      ballSpeedY = ballSpeedY * -1; 
    } else {
    text("GAME OVER!", width/2, height/2); // Once ball passes goal line text appears.
      noLoop(); // Code is officially stopped once ball passes goal line.
      if (ballX2 < 0 || ballX2 > width) {
    ballSpeedX = ballSpeedX * -1; // Once the ball reaches 0 on X-Axis it bounces off X-Axis
  }
  if (ballY2 < 0) {
    ballSpeedY = ballSpeedY * -1; // Once the ball reaches 0 on Y-Axis it bounces off Y-Axis
  }
  if (ballY2 > height-paddleHeight2) {
    if (ballX2 > mouseX && ballX2 < mouseX + 200) {
      ballSpeedY = ballSpeedY * -1; 
    } else {
      text("GAME OVER!", width/2, height/2); // Once ball passes goal line text appears.
      noLoop(); // Code is officially stopped once ball passes goal line.
        }
  }
    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20); // Draw’s the ball.
}

void drawPaddle() {
  stroke(paddleColor);
  strokeWeight(4);
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); // Draws the Paddle.
  rect(mouseX, 30, 200, paddleHeight); // Adds second paddle at top of screen.
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255))); // When the paddle moves from a certain position on the canvas, when the mouse is pressed it changes in grayscale.
}

void keyPressed() {
  if (key == 'b' || key == 'B') { // Color of paddle changes from white to black.
    fill(0);
  }
  if (key == 'w' || key == 'W') { // Color of paddle does not change unless “b” key is pressed.
    fill(255);
  }
}



