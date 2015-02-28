
PFont myFont;
//variables that actually change
int p1PosY;
int p2PosY;
int ballPosX;
int ballPosY;
int p1Score;
int p2Score;
float ballVelocityX;
float ballVelocityY;
boolean upPressed;
boolean downPressed;
boolean wPressed;
boolean sPressed;
int gameState; //0 = pre game, 1 = in game, 2 = game over
//constants
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
  myFont = loadFont("BankGothic-Light-28.vlw");
  textFont(myFont, 60);
  gameState = 0;
  paddleWidth = 30;
  paddleHeight = 70;
  p1PosY = 200;
  p2PosY = 200;
  p1PosX = 30;
  p2PosX = width - 60;
  playerSpeed = 7;
  ballPosX = 400;
  ballPosY = 300;
  ballVelocityX = 2;
  ballVelocityY = 1;
  ballSize = 15;
  upPressed = false;
  downPressed = false;
  wPressed = false;
  sPressed = false;
  maxScore = 3;
  p1Score = 0;
  p2Score = 0;
}

void draw() {
  background(0);
  fill(random(0, 200), random(100, 200), random(0, 255));

  if (gameState == 0) { //if we are in the pre-game menu
    text("NOT PONG", 200, 300);
    text("PRESS B", 200, 500);
    if (keyPressed  && key == 'b') {
      gameState = 1;
    }
  }

  if (gameState == 2) { //if we are in the game-over menu
    text("FINAL SCORE", 100, 100);
    text("PRESS R TO RESTART", 50, 300);
    text(p1Score, 100, 200);
    text(p2Score, 400, 200);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
    }
  }

  if (gameState == 1) { //if we are in game
    if (p1Score >= maxScore || p2Score >= maxScore) {
      gameState = 2;
    }
    text(p1Score, 100, 100);
    text(p2Score, 650, 100);
    rect(p1PosX, p1PosY, paddleWidth, paddleHeight);
    rect(p2PosX, p2PosY, paddleWidth, paddleHeight);
    ellipse(ballPosX, ballPosY, ballSize, ballSize);
    ballPosX += ballVelocityX; //same as ballPosX = ballPosX + ballVelocityX;
    ballPosY += ballVelocityY;

    //ball bounces off of player 1
    if (ballPosX > p1PosX && ballPosX < p1PosX + paddleWidth
      && ballPosY > p1PosY && ballPosY < p1PosY + paddleHeight) {
      ballVelocityX = ballVelocityX * -1.4;
    }
    //ball bounces off of player 2
    if (ballPosX > p2PosX && ballPosX < p2PosX + paddleWidth
      && ballPosY > p2PosY && ballPosY < p2PosY + paddleHeight) {
      ballVelocityX = ballVelocityX * -1.4;
    }
    //ball bounces off top or bottom of the screen
    if (ballPosY < 0 || ballPosY > height) {
      ballVelocityY = ballVelocityY * -1;
    }
    if (ballPosX < 0) {
      p2Score++;
      ballPosX = 300;
      ballPosY = 200;
      ballVelocityX = 4;
      ballVelocityY = 1;
    }
    if (ballPosX > width) {
      p1Score++;
      ballPosX = 500;
      ballPosY = 200;
      ballVelocityX = -4;
      ballVelocityY = 1;
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
    upPressed = true;
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
