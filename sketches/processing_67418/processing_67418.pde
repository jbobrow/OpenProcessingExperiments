
float ballX = 20;
float ballY = 62;
float ballSize = 10;
float speed = 1;
float xDirection = 1;
float yDirection = 1;
float paddleWidth = 60;
float paddleOffset = 10;
float paddleY;
float paddleTop;
float paddleBottom;

void setup () {
  size(300, 200);
}

void draw() {
  background(0);
  noStroke();
  
  paddleY = mouseY;
  paddleTop = mouseY - paddleWidth/2;
  paddleBottom = mouseY + paddleWidth/2;

  // paddle
  rectMode(CENTER);
  rect(paddleOffset, paddleY, 10, paddleWidth);
  
  // ball
  rect(ballX, ballY, ballSize, ballSize);
  
    // ball moving
  ballX = ballX + speed * xDirection;
  ballY = ballY + speed * yDirection;
  
  //ball bounce
  if (ballX > width || ballX < 0) {
    xDirection = xDirection * -1;
  }
  
  if (ballY > height || ballY < 0) {
    yDirection = yDirection * -1;
  }
  
  // paddle collision 
  if ((ballX + paddleWidth - paddleOffset < paddleWidth + paddleOffset) 
  && (ballY + ballSize >= paddleTop) 
  && (ballY + ballSize <= paddleBottom)) {
    xDirection = xDirection * -1;
  }
  
  println(paddleY);
}

