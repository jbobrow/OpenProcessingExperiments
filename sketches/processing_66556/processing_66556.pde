
//UI
PFont bigFont;
PFont smallFont;

//BALL
float ballSize = 20.0;
float ballRadius = ballSize/2;
float ballSpeedX = 2.0;
float ballSpeedY = 2.7;
float ballPosX;
float ballPosY;

//PLAYER
float p1Height = 80.0;
float p1Width = 15.0;
float p1PosY = 300;
float p1PosX = 0.0;
float p1Speed = 5.0;
boolean p1Win = false;

float p2Height = 80.0;
float p2Width = 15.0;
float p2PosY = 200.0;
float p2PosX = 485.0;
float p2Speed = 5.0;
boolean p2Win = false;

//STATE
int gameState;

/***********************************/

void setup() {
  size(500, 500);
  frameRate(60);

  bigFont = loadFont("PressStartK-80.vlw");
  smallFont = loadFont("PressStartK-16.vlw");
  
  ballPosX = width/2;
  ballPosY = height/2;
 
  gameState = 0;
}

void draw() {
  background(0);
  if (gameState == 0) {
    splashScreen();
  } else if (gameState == 1) {
    gameLoop();
  } else if (gameState == 2) {
    endScreen();
  }
}

/***********************************/

void player1() {
  
  if (keyPressed && key == CODED && keyCode == UP) {
    p1PosY -= p1Speed;
  } else if (keyPressed && key == CODED && keyCode == DOWN) {
    p1PosY += p1Speed;
  }

  if ((p1PosY + p1Height) >= height) {
    p1PosY = (height - p1Height);
  } else if (p1PosY <= 0) {
    p1PosY = 0;
  }
  
  fill(255);
  rect(p1PosX, p1PosY, p1Width, p1Height);
}

void player2() {
  
  if (keyPressed && key == 'w') {
    p2PosY -= p2Speed;
  } else if (keyPressed && key == 's') {
    p2PosY = p2PosY + p2Speed;
  }
  
  if ((p2PosY + p2Height) >= height) {
    p2PosY = (height - p2Height);
  } else if (p2PosY <= 0) {
    p2PosY = 0;
  }  
  
  fill(255);
  rect(p2PosX, p2PosY, p2Width, p2Height);
}

void gameBall() {
  
  ballPosX += ballSpeedX;
  ballPosY += ballSpeedY;
  
  if (ballPosX + ballRadius >= width) {
    p1Win = true;
    gameState = 2;
  }
  
  if (ballPosX - ballRadius <= 0) {
    p2Win = true;
    gameState = 2;
  }
  
  if (ballPosY >= width-ballRadius || ballPosY <= 0+ballRadius) {
    ballSpeedY *= -1.0;
  }
  
  if (ballPosX + ballRadius >= p2PosX && ballPosX + ballRadius <= p2PosX + p2Width && ballPosY >= p2PosY && ballPosY <= p2PosY + p2Height) {
    ballSpeedX *=-1.2;
  } else if (ballPosX - ballRadius >= p1PosX && ballPosX - ballRadius <= p1PosX + p1Width && ballPosY >= p1PosY && ballPosY <= p1PosY + p2Height) {
    ballSpeedX *=-1.2;
  }
    
  smooth();
  ellipse(ballPosX, ballPosY, ballSize, ballSize);  
  
}

void reset() {
  
  //BALL
  ballPosX = width/2;
  ballPosY = height/2;

//PLAYER
  p1PosY = 300;
  p1PosX = 0.0;
  p1Win = false;

  p2PosY = 200.0;
  p2PosX = 485.0;
  p2Win = false;  
}

/***********************************/

void splashScreen() {
  fill(255);
  textAlign(CENTER);
  
  textFont(bigFont);
  text("PONG", width/2, 100);
  
  textFont(smallFont);
  text("P1: UP/DOWN", width/2, 300);
  text("P2: W/S", width/2, 350);  
  text("PRESS SPACE TO START", width/2, 400);
  
  if(keyPressed && key == ' ') {
    gameState = 1;
  }
}

void gameLoop() {
  player1();
  player2();
  gameBall();
}

void endScreen() {
  fill(255);
  textFont(bigFont);
  text("GAME", width/2, 100);
  text("OVER", width/2, 200);
  
  textFont(smallFont);
  if (p1Win == true) {
    text("PLAYER 1 WINS!", width/2, 300);
  } else if (p2Win == true) {
    text("PLAYER 2 WINS!", width/2, 300);
  }
  
  text("PRESS SPACE TO PLAY AGAIN", width/2, 350);
  
  if(keyPressed && key == ' ') {
    reset();
    gameState = 1;
  }  
}

