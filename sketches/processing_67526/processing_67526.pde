

PImage run, logo, end, gameover, grass;
PFont myFont;
//variable that actually change

int level;
int timer;



//array of balls
int numBalls= 4;
int numBalls1=8;

float[] ballX = new float [numBalls];
float[] velX = new float [numBalls];

float [] ballY = new float [numBalls];
float [] velY = new float [numBalls]; 



float[] ballX1 = new float [numBalls1];
float[] velX1 = new float [numBalls1];

float [] ballY1 = new float [numBalls1];
float [] velY1 = new float [numBalls1]; 

//original code

int p1PosY;

int p1PosX;
int ballPosX;
int ballPosY;
int ballPosX1;
int ballPosY1;
int p1Score;
float ballVelocityX;
float ballVelocityY;
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;

int gameState; //0 = pre game, 1 = in game, 2 = game over

//constants

int paddleWidth;
int paddleHeight;
int ballSize;
int playerSpeed;
int maxScore;


void setup() {
  size(800, 600);
  frameRate(60);
  smooth();
  
grass= loadImage("grass.jpg");
  run= loadImage("sheep.png");
  logo = loadImage("players.png");  
  end = loadImage("end.jpg");
  gameover = loadImage("game.jpg");
  myFont = loadFont("FontdinerdotcomHuggable-30.vlw");

  textFont(myFont, 34);
  constructGame();
}

void constructGame() {
  level = 1;
  timer = 0;

  for (int i = 0; i < numBalls; i++) {
    fill(255, 250, 103);

    velX [i] = random(5);
    velY [i] = random(10);
  }

  gameState = 0;
  paddleWidth= 50;
  paddleHeight= 65;

  p1PosY= 200;

  p1PosX= 200;

  p1PosX= width - 60;
  playerSpeed = 7;
  ballPosX= 400;
  ballPosY= 300;
  ballPosX1= 600;
  ballPosY1= 500;
  ballVelocityX= -1;
  ballVelocityY= -2;
  ballSize = 70;
  upPressed = false;
  downPressed = false;
  leftPressed = false;
  rightPressed = false;

  maxScore = 0;

  p1Score= 3;
}

void draw() {

  //Wold Movement
  if (upPressed == true) {
    p1PosY -= playerSpeed;
  }
  if (downPressed == true) {
    p1PosY += playerSpeed;
  }
  if (leftPressed == true) {
    p1PosX -= playerSpeed;
  }
  if (rightPressed == true) {
    p1PosX += playerSpeed;
  }
  if (p1PosY<0) {
    p1PosY=0;
  }
  if (p1PosY + paddleHeight > height) {
    p1PosY= height - paddleHeight;
  }

  if (p1PosX + paddleWidth> width) {
    p1PosX= 0 - paddleWidth;
  }
  if (p1PosX + paddleWidth< 0) {
    p1PosX= width - paddleWidth;
  }

  ///

  timer++;
  println(timer);
  background(13, 155, 13);
  if (timer > 900) {
    level2();
  }

  //  if(timer > 1000){
  //    level3();
  //  }

  if (gameState==0) { // if we are in the pre-game menu
    image(end, 0, 0, 800, 600);
  }

  if (gameState==1) {
    level1();
  } 


  if (gameState == 2) { //if we are in the game-over menu
    image(gameover, 0, 0, 800, 600);


    if (keyPressed && key == 'r') {
      gameState=0;
      // setup();
      constructGame();
    }
  }
  if (gameState ==1) { //if we are in game
    if (p1Score == maxScore) {
      gameState =2;
      //        text("lives:"+p1Score, 650, 100);
    }


    text("lives: "+p1Score, 640, 50);
    image(logo, p1PosX, p1PosY, paddleWidth, paddleHeight);
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

  if (key =='b') {
    gameState = 1;
  }
}

//// FUNCTIONS 

void level1() {


  //array of balls

  //    for (int i=0; i<numBalls; i++) {
  //    ballX[i]+=velX[i];
  //    ballY[i]+=velY[i];
  // 
  //    if ((ballX[i]<0)||(ballX[i]>width)) {
  //                                              
  //      velX[i]=velX[i]*-1;
  //    }
  // 
  //    if ((ballY[i]<0)||(ballY[i]>height)) {
  //      velY[i]=velY[i]*-1;
  //    }
  // 
  //    if ((ballY[i]>height || ballY[i] < 0)) {
  // 
  //    }
  //   image(run, ballX[i], ballY[i], 30, 30);
  //  }




  //original ball 

  image(run, ballPosX, ballPosY, 40, 40);
  ballPosX += ballVelocityX; //same as ballPosX + ballVelocityX
  ballPosY += ballVelocityY;


  //how ball bounces off paddle
  if (ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth
    && ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight) {
    ballVelocityX = ballVelocityX * -1;
  } 
  if (ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight
    && ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth) {
    ballVelocityY = ballVelocityY * -1;
  }   


  if (ballPosX < 0 || ballPosX> width || ballPosY<0 || ballPosY>height) {
    p1Score--;
    ballPosX = 300;
    ballPosY = 200;
    ballVelocityX=4;
    ballVelocityY=1;
  }
}



////Function level2

void level2() {

  //array of balls

  //    int numBalls = 2;

  for (int i=0; i<numBalls; i++) {
    ballX[i]+=velX[i];
    ballY[i]+=velY[i];

    if ((ballX[i]<0)||(ballX[i]>width)) {

      velX[i]=velX[i]*-1;
    }

    if ((ballY[i]<0)||(ballY[i]>height)) {
      velY[i]=velY[i]*-1;
    }

    if ((ballY[i]>height || ballY[i] < 0)) {
    }
    image(run, ballX[i], ballY[i], ballSize, ballSize);
  }




  //original ball 

  //   image(run, ballPosX, ballPosY, ballSize, ballSize);
  //    ballPosX += ballVelocityX; //same as ballPosX + ballVelocityX
  //    ballPosY += ballVelocityY;
  //   
  //
  for (int i = 0; i < numBalls; i++) {
    //how ball bounces off paddle
    if (ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth
      && ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight) {
      ballVelocityX = ballVelocityX * -1;
    } 
    if (ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight
      && ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth) {
      ballVelocityY = ballVelocityY * -1;
    }   


    if (ballPosX < 0 || ballPosX> width || ballPosY<0 || ballPosY>height) {
      p1Score++;
      ballPosX = 300;
      ballPosY = 200;
      ballVelocityX=4;
      ballVelocityY=1;
    }
  }
}




void level3() {

  //array of balls

  //    int numBalls = 2;

  for (int i=0; i<numBalls1; i++) {
    ballX1[i]+=velX1[i];
    ballY1[i]+=velY1[i];

    if ((ballX1[i]<0)||(ballX1[i]>width)) {

      velX1[i]=velX1[i]*-1;
    }

    if ((ballY1[i]<0)||(ballY1[i]>height)) {
      velY1[i]=velY1[i]*-1;
    }

    if ((ballY1[i]>height || ballY1[i] < 0)) {
    }
    image(run, ballX1[i], ballY1[i], ballSize, ballSize);
  }




  //original ball 

  //   image(run, ballPosX, ballPosY, ballSize, ballSize);
  //    ballPosX += ballVelocityX; //same as ballPosX + ballVelocityX
  //    ballPosY += ballVelocityY;
  //   
  //
  for (int i = 0; i < numBalls; i++) {
    //how ball bounces off paddle
    if (ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth
      && ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight) {
      ballVelocityX = ballVelocityX * -1;
    } 
    if (ballPosY> p1PosY && ballPosY < p1PosY + paddleHeight
      && ballPosX> p1PosX && ballPosX < p1PosX + paddleWidth) {
      ballVelocityY = ballVelocityY * -1;
    }   


    if (ballPosX < 0 || ballPosX> width || ballPosY<0 || ballPosY>height) {
      p1Score++;
      ballPosX = 300;
      ballPosY = 200;
      ballVelocityX=4;
      ballVelocityY=1;
    }
  }
}


