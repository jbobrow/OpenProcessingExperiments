
int ballX;
int ballY;
int ballSpeedX = 5;
int ballSpeedY = 5;
int paddleHeight = 30;
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
    if (ballX > mouseX && ballX < mouseX + 200) {
      ballSpeedY = ballSpeedY * -1;
    } else {
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
  stroke(paddleColor);
  strokeWeight(4);
  rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
}
 
void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    fill(0);
  }
  if (key == 'w' || key == 'W') {
    fill(255);
  }
}

