
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
int gameState; //0 = oregame, 1 = in game, 2 = game over
int maxScore;

//constants
int p1PosX;
int p2PosX;
int paddleWidth;
int paddleHeight;
int ballSize;
int playerSpeed;

void setup() {
  size(800, 600);
  gameState=0;
  paddleWidth = 30;
  paddleHeight = 70;
  p1PosY = 200;
  p2PosY = 200;
  p1PosX = 30;
  p2PosX = width - 70;
  playerSpeed = 6;
  ballPosX = 400;
  ballPosY = 300; 
  ballVelocityX = -3;
  ballVelocityY =1;
  ballSize = 16;
  myFont = loadFont("VisitorTT1BRK-48.vlw");
  textFont(myFont, 48);
  upPressed=false;
  downPressed=false;
  wPressed=false;
  sPressed=false;
  maxScore = 11;
  p1Score=0;
  p2Score=0;
}

void draw() {
  background(0);

  if (gameState==0) {
    textFont(myFont,140);
    text("PONG", 140, 225);
    textFont(myFont,90);
    text("PRESS ENTER", 140, 350);
    if (keyPressed && key == ENTER) {
      gameState=1;
    }
  }
  
  

  if (gameState==2) {
    textFont(myFont,48);
    text(p1Score, 20, 50);
    text(p2Score, 700, 50);
    textFont(myFont,70);
    text("FINAL SCORE", 140, 275);
    textFont(myFont,40);
    text("Press R to Restart", 140, 325);
    if (keyPressed && key == 'r') {
      gameState=0;
      setup();
    }
  }

  if (gameState ==1) {
    if(p1Score>= maxScore || p2Score >=maxScore){gameState=2;}
    fill(255);
    rect(p1PosX, p1PosY, paddleWidth, paddleHeight);
    rect(p2PosX, p2PosY, paddleWidth, paddleHeight);
    ellipse(ballPosX, ballPosY, ballSize, ballSize);
    ballPosX += ballVelocityX;
    ballPosY += ballVelocityY;

    // ball bounces off player 1
    if (ballPosX > p1PosX && ballPosX <p1PosX + paddleWidth
      && ballPosY > p1PosY && ballPosY < p1PosY+ paddleHeight) {
      ballVelocityX*=-1.05;
    }
    //ball bounces off of player 2
    if (ballPosX > p2PosX && ballPosX <p2PosX + paddleWidth
      && ballPosY > p2PosY && ballPosY < p2PosY+ paddleHeight) {
      ballVelocityX*=-1.05;
    }
    //ball bounces off sides     
    if (ballPosY>height || ballPosY<0) {
      ballVelocityY*=-1;
    }

    //draw score
    text(p1Score, 20, 50);
    text(p2Score, 700, 50);

    if (ballPosX < 0) {
      p2Score++;
      ballPosX = 300;
      ballPosY = 200;
      ballVelocityX=4;
      ballVelocityY=1;
    }

    else if (ballPosX > width) {
      p1Score++;
      ballPosX = 500;
      ballPosY = 200;
      ballVelocityX=-4;
      ballVelocityY=1;
    }
    if (p1PosY>height-paddleHeight) {
      p1PosY=height-paddleHeight;
    }
    if (p1PosY<0) {
      p1PosY=0;
    }

    if (p2PosY>height-paddleHeight) {
      p2PosY=height-paddleHeight;
    }
    if (p2PosY<0) {
      p2PosY=0;
    }
    if (upPressed) {
      p2PosY-=playerSpeed;
    }
    if (downPressed) {
      p2PosY+=playerSpeed;
    }

    if (sPressed) {
      p1PosY+=playerSpeed;
    }
    if (wPressed) {
      p1PosY-=playerSpeed;
    }
  }
}

void keyPressed() {
  if (keyCode == 'W') {
    wPressed=true;
  }
  if (keyCode == 'S') {
    sPressed=true;
  }
  if (keyCode == UP) {
    upPressed=true;
  }
  if (keyCode == DOWN) {
    downPressed=true;
  }
}

void keyReleased() {
  if (keyCode == 'W') {
    wPressed=false;
  }
  if (keyCode == 'S') {
    sPressed=false;
  }
  if (keyCode == UP) {
    upPressed=false;
  }
  if (keyCode == DOWN) {
    downPressed=false;
  }
}

/*
  player 1 -positionY
 player 2 -positionY
 ball - positionX, positionY, direction
 
 is ball to right of screen
 is ball to left of screen
 is ball touching player 1
 is ball touching player 2
 
 player1score
 player2score
 */

