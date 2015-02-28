
/* WHAT WE ARE GOING TO NEED
player 1 - positionY
 player 2 - positionY
 ball - positionX, positionY, direction
 
 is the ball to the right of screen
 is ball to the left of screen
 is ball touching player 1
 is ball touching player 2
 
 player 1 score
 player 2 score

 */


PFont myFont;

//variables that actually change! 
int p1PosY;
int p2PosY;
int ballPosX;
int ballPosY;
int p1Score;
int p2Score;
int ballVelocityX;
int ballVelocityY;

//for bug issues
boolean upPressed;
boolean downPressed;
boolean wPressed;
boolean sPressed;
int gameState;    //0 = pre game, 1 = in game 2 = game over

//constants
int p1PosX;
int p2PosX;
int paddleWidth;
int paddleHeight;
int ballSize;
int playerSpeed;
int maxScore;

void setup() {
  myFont = loadFont("NokiaCellphoneFC-Small-30.vlw");
  textFont (myFont, 30);

  size(800, 600);
  paddleWidth=30;
  paddleHeight=70;

  gameState = 0; //scores
  maxScore = 3;
  p1Score = 0;
  p2Score = 0;

  p1PosY = 200;
  p2PosY = 200;
  p1PosX = 30;
  p2PosX = width-60;
  playerSpeed = 12;
  ballPosX = 400;
  ballPosY = 300;
  ballVelocityX = 4;
  ballVelocityY = 1;
  ballSize = 20;

  upPressed = false;
  downPressed = false;
  wPressed = false;
  sPressed = false;
}

void draw() {
  background(0);

  if (gameState == 0) { //if we are in the pre-game menu
    fill(random(255),random(255),random(255));
    text("NOT PONG", 310, 250);
    text("PRESS B", 340, 500); 
    
    if (keyPressed && key == 'b') {
      gameState = 1;
    }
  }
  
    if (gameState == 2) {    // game-over menu
    text("FINAL SCORE", 270, 50);
    text("PRESS R To RESTART", 230, 300);
    text(p1Score, 50, 50);
    text(p2Score, width-50, 50);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup ();
    }
  }

    if (gameState == 1) { //if the game is on playing
    if (p1Score >= maxScore || p2Score >= maxScore){
       gameState = 2;
    }

      text(p1Score, 200, 100);
      text(p2Score, 550, 100);
      smooth();
      //Rectangle for Player1
      rect(p1PosX, p1PosY, paddleWidth, paddleHeight); 
      //Rectangle for Player2
      rect(p2PosX, p2PosY, paddleWidth, paddleHeight);
      //Creation of the ball
      ellipse(ballPosX, ballPosY, ballSize, ballSize);
      ballPosX += ballVelocityX;
      ballPosY += ballVelocityY;

      //ball bounces off PLAYER2
      if (ballPosX > p1PosX && ballPosX < p1PosX + paddleWidth && 
        ballPosY > p1PosY && ballPosY < p1PosY + paddleHeight) {
        ballVelocityX *= -1;
      }
      //ball bounces off PLAYER2
      if (ballPosX > p2PosX && ballPosX < p2PosX + paddleWidth && 
        ballPosY > p2PosY && ballPosY < p2PosY + paddleHeight) {
        ballVelocityX *= -1;
      }

      //ball bounces off top or bottom of the screen
      if (ballPosY < 0 || ballPosY > height) {
        ballVelocityY*=-1;
      }

      if (ballPosX < 0) {
        p2Score++;
        ballPosX =300;
        ballPosY = 200;
        ballVelocityX = 4;
        ballVelocityY = 2;
      }

      if (ballPosX > width) {
        p1Score++;
        ballPosX =300;
        ballPosY = 200;
        ballVelocityX = 4;
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

      //paddles out of screen
      if (p1PosY < 0) {
      p1PosY = 0;
    }
    if (p2PosY < 0) {
      p2PosY = 0 ;
    }
    if (p1PosY + paddleHeight > height) {
      p1PosY = height - paddleHeight;
    }
    if (p2PosY + paddleHeight > height) {
      p2PosY = height - paddleHeight;
    }
  }
}


void keyPressed () {
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

void keyReleased () {
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

