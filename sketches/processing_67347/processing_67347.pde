
PFont scoreFont;

//variables that actually change 
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
int maxScore;

//constants
int p1PosX;
int p2PosX;
int paddleWidth;
int paddleHeight;
int ballsize;
int playerSpeed;
int ease;
int gameState; // 0 = pre game, 1 = in game, 2 = game over

String start;
String end;

void setup() {
  size(800, 600);
  smooth();
  scoreFont=loadFont("2Dumb-48.vlw");
  textFont(scoreFont, 48);
  
  start = ("Let's begin, press b");
  end = ("gameOver, press r restart");
  
  maxScore = 5;
  paddleWidth = 30;
  paddleHeight = 70;
  playerSpeed = 10;
  ease=5;

  p1PosY = 200;
  p2PosY = 200;
  p1PosX = 30;
  p2PosX = width - 30 - paddleWidth;

  ballsize =30;
  ballPosX = 400;
  ballPosY = 300;

  ballVelocityX = 3;
  ballVelocityY = 1;

  upPressed = false;
  downPressed = false;
  wPressed = false;
  sPressed = false;
  
  p1Score = 0;
  p2Score = 0;
}

void draw() {
  background(0);
  if (gameState ==0) {   
    gameBegin();
  }
  if (gameState ==1) {
    gamePlay();
  }

  if (gameState ==2) {
    gameOver();
  }
}

void gameBegin() {
  text(start,100,100);
  if (keyPressed && key =='b') {
    gameState = 1;
    
  }
}

void gameOver() {
  text(end,100,100);
  text("final score:" + p1Score +p2Score,50,200);
  if (keyPressed && key =='r') {
    gameState = 1;
  }
}

void gamePlay() {

  fill(0, 20);
  rect(width, height, width, height);

  fill(255);
  rect(p1PosX, p1PosY, paddleWidth, paddleHeight);
  rect(p2PosX, p2PosY, paddleWidth, paddleHeight);

  text(p1Score, 200, 500);
  text(p2Score, 600, 500);

  fill(255, 0, 0);
  ellipse(ballPosX, ballPosY, ballsize, ballsize);
  ballPosX += ballVelocityX;
  ballPosY += ballVelocityY;

  if (ballPosX > p1PosX && ballPosX< p1PosX+ paddleWidth
    && ballPosY > p1PosY && ballPosY < p1PosY + paddleHeight) {
    ballVelocityX *= -1;
  }
  if (ballPosX > p2PosX && ballPosX< p2PosX + paddleWidth
    && ballPosY > p2PosY && ballPosY < p2PosY + paddleHeight) {
    ballVelocityX *= -1;
  }    
  if (ballPosY > height || ballPosY < 0) {
    ballVelocityY *= -1;
  }

  if (ballPosX< 0) {
    p2Score ++;
    ballReset();
  }
  if (ballPosX> width) {
    p1Score ++;
    ballReset();
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

  if (p1PosY < 0 ) {
    p1PosY = 0;
  }
  if (p2PosY < 0 ) {
    p2PosY= 0;
  }
  if (p1PosY + paddleHeight > height) {
    p1PosY = height - paddleHeight;
  }
  if (p2PosY + paddleHeight > height) {
    p2PosY = height - paddleHeight;
  } 

  if (p1Score > maxScore || p2Score > maxScore) {
    gameState = 2;
  }
}

void ballReset() {
  ballPosX = width/2;
  ballPosY = height/2;
  ballVelocityX *=-1.2;
  ballVelocityY *=1.2;
}

void keyPressed() {
  if (keyCode == UP) {
    p2PosY -=playerSpeed;
    upPressed =true;
  }

  if (keyCode == DOWN) {
    p2PosY +=playerSpeed;
    downPressed =true;
  }

  if (keyCode == 'W') {
    p1PosY -=playerSpeed;
    wPressed =true;
  }

  if (keyCode == 'S') {
    p1PosY +=playerSpeed;
    sPressed =true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    p2PosY -=playerSpeed;
    upPressed =false;
  }

  if (keyCode == DOWN) {
    p2PosY +=playerSpeed;
    downPressed =false;
  }

  if (keyCode == 'W') {
    p1PosY -=playerSpeed;
    wPressed =false;
  }

  if (keyCode == 'S') {
    p1PosY +=playerSpeed;
    sPressed =false;
  }
}


