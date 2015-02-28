
PFont myFont;
float r=int(random(255));
float g=int(random(255));
float b=int(random(255));

//variables that actually change:
int p1PosY;
int p2PosY; 
int ballPosX;
int ballPosY;
int p1Score;
int p2Score;
int ballVelocityX;
int ballVelocityY;
boolean upPressed;
boolean downPressed;
boolean wPressed;
boolean sPressed;
int gameState; //0 = start game, 1 = playing, 2 = game over

//constatnts:
int p1PosX;
int p2PosX;
int paddleWidth;
int paddleHeight;
int ballSize;
int playerSpeed;
int maxScore;



void setup() {
  size(800, 600);
  smooth();
  myFont = loadFont("BankGothicBT.vlw");
  textFont(myFont, 100);
  paddleWidth = 30;
  paddleHeight = 70;
  p1PosY = 200;
  p2PosY = 200;
  p1PosX = 30;
  p2PosX = width - 60;
  playerSpeed = 5;
  ballPosX = 400;
  ballPosY = 300;
  ballVelocityX = 4;
  ballVelocityY = 1;
  ballSize = 15;
  upPressed = false;
  downPressed = false;
  wPressed = false;
  sPressed = false;
  gameState = 0;
  maxScore = 4;
  p1Score = 0;
  p2Score = 0;
}


void draw() {
  background(ballPosY/2-r, ballPosX/3-g, (r+g)/2-b);
  println("r = "+ballPosY/2+ "g = "+ballPosX/3+ "b="+(r+g)/2);

  if (gameState == 0) {
    text("'NOT PONG'", 85, 200);
    text("PRESS B", 150, 400);
    if (keyPressed && key == 'b') {
      gameState = 1;
    }
  }

  if (gameState == 2) { 
    textFont(myFont, 50);
    text("FINAL SCORE", 200, 200);
    text("PRESS 'R' TO RESTART", 100, 400);
    textFont(myFont, 100);
    text(p1Score, 100, 300);
    text(p2Score, 600, 300);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
    }
  }


if (gameState == 1) {
  if (p1Score >= maxScore || p2Score >= maxScore) {
    gameState = 2;
  }
      text(p1Score, 100, 100);
      text(p2Score, 600, 100);
      rect(p1PosX, p1PosY, paddleWidth, paddleHeight);
      rect(p2PosX, p2PosY, paddleWidth, paddleHeight);
      ellipse(ballPosX, ballPosY, ballSize, ballSize);
      ballPosX += ballVelocityX; //same as ballPosX = ballPosX + ballVelocityX
      ballPosY += ballVelocityY;

      //ball bounces off of player1
      if (ballPosX > p1PosX && ballPosX < p1PosX + paddleWidth && ballPosY > p1PosY && ballPosY < p1PosY + paddleHeight) {
        ballVelocityX = ballVelocityX * (-1);
      }
      //ball bounces off of player2
      if (ballPosX > p2PosX && ballPosX < p2PosX + paddleWidth && ballPosY > p2PosY && ballPosY < p2PosY + paddleHeight) {
        ballVelocityX = ballVelocityX * (-1);
      }
      //ball bounces off top o rbottom of the screen
      if (ballPosY > height || ballPosY < 0) {
        ballVelocityY = ballVelocityY * (-1);
      }
      if (ballPosX < 0) {
        p2Score++;
        ballPosX = 300;
        ballPosY = 200;
        ballVelocityX = 4;
        ballVelocityY = 2;
      }

      if (ballPosX > width) {
        p1Score++;
        ballPosX = 500;
        ballPosY = 200;
        ballVelocityX = -4;
        ballVelocityY = 2;
      }

      if (upPressed == true) {
        p2PosY -= playerSpeed;
      }

      if (downPressed == true) {
        p2PosY += playerSpeed;
      }

      if (wPressed == true) {
        p1PosY -= playerSpeed;
      }

      if (sPressed == true) {
        p1PosY += playerSpeed;
      }

      if (p1PosY < 0) { 
        p1PosY = 0;
      }

      if (p2PosY < 0) { 
        p2PosY = 0;
      }

      if (p1PosY + paddleHeight > height) { 
        p1PosY = height - paddleHeight;
      }

      if (p2PosY + paddleHeight > height) { 
        p2PosY = height - paddleHeight;
      }
    }
  }

  void keyPressed() {
    if (keyCode == UP) {
      upPressed = true; //same as saying p2PosY = p2PosY - 3;
    }
    if (keyCode == DOWN) {
      downPressed = true;
    }
    if (keyCode == 'W') {
      wPressed = true;
    }
    if (keyCode == 'S') {
      sPressed = true;
    }
  }

  void keyReleased() {
    if (keyCode == UP) {
      upPressed = false;
    }
    if (keyCode == DOWN) {
      downPressed = false;
    }
    if (keyCode == 'W') {
      wPressed = false;
    }
    if (keyCode == 'S') {
      sPressed = false;
    }
  }


