

PFont myFont;
//variable that actually change

int p1PosY;

int p1PosX;
int ballPosX;
int ballPosY;
int p1Score;
float ballVelocityX;
float ballVelocityY;
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean wPressed;
boolean sPressed;
int gameState; //0 = pre game, 1 = in game, 2 = game over

//constants

int paddleWidth;
int paddleHeight;
int ballSize;
int playerSpeed;
int maxScore;


void setup() {
  size(800, 600);
  smooth();
  myFont = loadFont("Univers.vlw");
  textFont(myFont, 70);
  gameState = 0;
  paddleWidth= 50;
  paddleHeight= 50;

  p1PosY= 200;

  p1PosX= 200;
  
  p1PosX= width - 60;
  playerSpeed = 7;
  ballPosX= 400;
  ballPosY= 300;
  ballVelocityX= -1;
  ballVelocityY= -2;
  ballSize = 15;
  upPressed = false;
  downPressed = false;
  leftPressed = false;
  rightPressed = false;
  wPressed= false;
  sPressed = false;
  maxScore = 3;
  
  p1Score= 0;
}


void draw() {
  background(0);
  if (gameState==0) { // if we are in the pre-game menu
    text("CATCH THE BALL", 300, 300);
    text("PRESS B", 300, 500);
    if (keyPressed && key =='b') {
      gameState = 1;
    }
  }
  if (gameState == 2) { //if we are in the game-over menu
    text("FINAL SCORE", 250, 50);
    text("PRESS R TO RESTART", 250, 30);
  
    text(p1Score, 650, 100);
    if (keyPressed && key == 'r') {
      gameState=0;
      setup();
    }
  }
  if (gameState ==1) { //if we are in game
    if (p1Score >= maxScore) {
      gameState =2;
    }
    
    text(p1Score, 650, 100);

    rect(p1PosX, p1PosY, paddleWidth, paddleHeight);
    
    
    ellipse(ballPosX, ballPosY, ballSize, ballSize);
    ballPosX += ballVelocityX; //same as ballPosX + ballVelocityX
    ballPosY += ballVelocityY;


   

    //how ball bounces off paddle
    if (ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth
      && ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight) {
      ballVelocityX = ballVelocityX * -1;
    }  

//    //ball bounces off top or bottom of the screen
//    if (ballPosY < 0 || ballPosY > height) {
//      ballVelocityY = ballVelocityY *-1;
//    }
//    
//     if (ballPosX < 0 || ballPosX > width) {
//      ballVelocityX = ballVelocityX *-1;
//    }
    
    
    
    if (ballPosX < 0 || ballPosX> width || ballPosY<0 || ballPosY>height)  {
      p1Score++;
      ballPosX = 300;
      ballPosY = 200;
      ballVelocityX=4;
      ballVelocityY=1;
    }
  
    }
    if (upPressed == true) {
      p1PosY -= playerSpeed;
    }
    if (downPressed == true) {
      p1PosY += playerSpeed;
    }
    if (leftPressed == true) {
      p1PosX -= playerSpeed;
    }
    if(rightPressed == true){
        p1PosX += playerSpeed;
    }
    if (p1PosY<0) {
      p1PosY=0;   
    }
    if (p1PosY + paddleHeight > height) {
      p1PosY= height - paddleHeight;
    }
  
  
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed=true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
 if (keyCode == RIGHT) {
   println("right");
    rightPressed = true;
  }
   if (keyCode == LEFT) {
    leftPressed = true;
  }
  
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed=false;
  }

  if (keyCode == LEFT) {
    leftPressed=false;
  }

  if (keyCode == RIGHT) {
  }
    rightPressed=false;
  
  if (keyCode == DOWN) {
    downPressed = false;

}}


