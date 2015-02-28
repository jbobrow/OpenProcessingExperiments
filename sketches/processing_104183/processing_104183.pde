
//Global Variables Here
//background variables here;
int widthD= 400;
int heightD= 700;


//ballVariables here
int ballX=50;
int ballY= 50;
float speedX, speedY;
int originalSpeedX= 2;
int originalSpeedY= 5;
int ballWidth=26;
int ballR= ballWidth/2;
color ballColor= color(255, 0, 0);


//paddle variables here
int paddleWidth=100;
int paddleHeight=20;
int paddleSpeed= 10;

//paddle 1&2 variables here
int paddle1X=widthD/2;
int paddle1Y=heightD-paddleHeight;
color paddle1Color= color(0, 255, 0);
int paddle1Speed= 0;


int paddle2X=widthD/2;
int paddle2Y=0;
color paddle2Color= color(0, 255, 255);
int paddle2Speed= 0;

//Game Variables
boolean pause= false;
boolean start= false;
int score1= 0;
int score2=0;

void setup() {
  size(widthD, heightD);
  background(0);
}

void draw() {
  if (start) {
    if (!pause) {
      background(0, 0, 0, 50); 
      drawBall();
      drawPaddles();
      updatePositions();
      checkForWallCollision();
      checkPaddleCollision();
      showText("Blue: " + score2 + "Green:" + score1);
    } 
    else {
      background(0, 0, 0, 50); 
      showText("This Game Is Paused");
      println("Paused is: " + pause);
    }
  } 
  else {
    background(0);
    showText("Press Space to Start");
    speedX= originalSpeedX;
    speedY= originalSpeedY;
  }
}
//This draws the ball
void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballWidth, ballWidth);
}

//this draws the paddles
void drawPaddles() {
  fill(paddle1Color);
  rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
  fill(paddle2Color);
  rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);
}

//this updates the position
void updatePositions() {
  ballX-=speedX;
  ballY+=speedY;
  paddle1X+=paddle1Speed;
  paddle2X+=paddle2Speed;
}

void showText(String text) {
  textSize(32);
  String name= text;
  float widthText= textWidth(name);
  float textX= width/2-widthText/2;
  int textY= height/2;
  fill(255);
  //rect(textX, textY-32, widthText, 32);
  fill(0, 102, 153);
  text(name, textX, textY);
}

void checkForWallCollision() {
  if (ballX> width-ballR || ballX<ballR) {
    speedX*=-1;
  }
  if (ballY<ballR) {
    score1+=1;
    ballX=width/2-ballR;
    ballY=height/2-ballR;
    start=false;
  } 
  else if (ballY>height-ballR) {
    score2+=1;
    ballX=width/2-ballR;
    ballY=height/2-ballR;
    start=false;
  }
}

//Check for ball colliding with paddle and prevents paddle from going off screen
void checkPaddleCollision() {
  //ball collides with paddle1
  if ((ballX+ballR)>paddle1X && (ballX-ballR)<paddle1X+paddleWidth) {
    if (ballY+ballR>paddle1Y) {
      speedY*=-1.1;
    }
  }
  //ball colides with paddle2
  if ((ballX+ballR)>paddle2X && (ballX-ballR)<paddle2X+paddleWidth) {
    if (ballY-ballR<paddle2Y+paddleHeight) {
      speedY*=-1;
    }
  }
  //Prevents the paddle from going off the screen
  if (paddle1X<=0) {
    paddle1X=paddle1Speed;
  }
  if (paddle2X<=0) {
    paddle2X=0;
  }
  if (paddle1X>= width - paddleWidth) {
    paddle1X=width-paddleWidth;
  }
  if (paddle2X>= width - paddleWidth) {
    paddle2X=width-paddleWidth;
  }
}


/*********EVENT FUNCTIONS*****************/
//Pauses the game if the mouse is clicked.
void mouseClicked() {
  pause=!pause;
}

void keyTyped() {
  if (key=='s') {
    paddle1Speed=abs(paddleSpeed);
  }
  if (key=='a') {
    paddle1Speed=-abs(paddleSpeed);
  }
  if (key=='l') {
    paddle2Speed=abs(paddleSpeed);
  }
  if (key=='k') {
    paddle2Speed=-abs(paddleSpeed);
  }
  if (key==' ') {
    start=!start;
  }
}

void keyReleased() {
  if (key=='s'|| key=='a') {
    paddle1Speed=0;
  }
  if (key=='l' || key=='k') {
    paddle2Speed=0;
  }
}
