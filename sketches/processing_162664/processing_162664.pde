
float ballX;
float ballY;
float ballRadius = 20;
float xSpeed =3;
float ySpeed =1;
float paddleOneX;
float paddleTwoX;
float paddleOneY;
float paddleTwoY;
float paddleWidthX;
float paddleHeightX;
float paddleWidthY;
float paddleHeightY;

void setup() {
  size(400, 400);
  ballX = width/2;
  ballY = height/2;

  paddleOneX = 20;
  paddleTwoX = width - 20;

  paddleOneY =20;
  paddleTwoY = height - 20;

  noStroke();
  rectMode(CENTER);
}

void draw() {

  noCursor();
  background(255);

  paddleWidthX = 10;
  paddleHeightX = 70;

  paddleHeightY =10;
  paddleWidthY = 70;

  fill(255, 255, 0);
  ellipse(ballX, ballY, ballRadius, ballRadius);

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;

  if (ballX+ballRadius/2>paddleTwoX-paddleWidthX/2) {
    if (ballY>mouseY-paddleHeightX/2 && ballY<mouseY+paddleHeightX/2) {
      xSpeed = xSpeed*-1;
      ballX = (paddleTwoX - paddleWidthX/2)-ballRadius;
    }
  }
  if (ballX-ballRadius/2<paddleOneX+paddleWidthX/2) {
    if (ballY>mouseY-paddleHeightX/2 && ballY<mouseY+paddleHeightX/2) {
      xSpeed = xSpeed*-1;
    }
  }

  if (ballY+ballRadius/2>paddleTwoY-paddleHeightY/2) {
    if (ballX>mouseX-paddleWidthY/2 && ballX<mouseX+paddleWidthY/2) {
      ySpeed = ySpeed*-1;
      ballY = (paddleTwoY - paddleHeightY/2)-ballRadius;
    }
  }
  if (ballY-ballRadius/2<paddleOneY+paddleHeightY/2) {
    if (ballX>mouseX-paddleWidthY/2 && ballX<mouseX+paddleWidthY/2) {
      ySpeed = ySpeed*-1;
    }
  }

  stroke(0);
  fill(122, 122, 120);
  rect(paddleOneX, mouseY, paddleWidthX, paddleHeightX);
  rect(paddleTwoX, mouseY, paddleWidthX, paddleHeightX);

  rect(mouseX, paddleOneY, paddleWidthY, paddleHeightY);
  rect(mouseX, paddleTwoY, paddleWidthY, paddleHeightY);
}

void mousePressed() {

  ballX = width/2;
  ballY = height/2;
}


