
//UI
PFont bigFont;
PFont smallFont;

//BALL
float ballSize;
float ballRadius;
float ballSpeedX;
float ballSpeedY;
float ballPosX;
float ballPosY;

//PLAYER
float playerSpeed;
float playerWidth;
float playerHeight;
float playerPosY;
float currentPlayerPosY;

//STATE
boolean collisionWithBall;
int gameState;
String winner;


/***********************************/

void setup() {
  size(500, 500);
  frameRate(60);

  bigFont = loadFont("PressStartK-80.vlw");
  smallFont = loadFont("PressStartK-16.vlw");

  ballSize = 20.0;
  ballRadius = ballSize/2;
  ballSpeedX = 1.5;
  ballSpeedY = 2.0;
  ballPosX = width/2;
  ballPosY = height/2;

  playerSpeed = 5;
  playerWidth = 15;
  playerHeight = 80;
  playerPosY = height/2 - playerHeight/2;

  gameState = 0;
  winner = "No winner yet";
}

void draw() {
  background(0);
  if (gameState == 0) {
    splashScreen();
  } 
  else if (gameState == 1) {
    gameLoop();
  }
  else if (gameState == 2) {
    endScreen();
  }
}


/***********************************/


void splashScreen() {
  fill(255);
  textAlign(CENTER);

  textFont(bigFont);
  text("PONG", width/2, 100);

  textFont(smallFont);
  text("P1: W/S", width/2, 300);
  text("P2: O/K", width/2, 350);  
  text("PRESS SPACE TO START", width/2, 400);

  if (keyPressed && key == ' ') {
    gameState = 1;
  }
}

void gameLoop() {
  player('w', 's', 0, playerPosY);
  player('o', 'k', width-playerWidth, playerPosY);  
  gameBall();
}

void endScreen() {
  fill(255);
  textFont(bigFont);
  text("GAME", width/2, 100);
  text("OVER", width/2, 200);

  textFont(smallFont);
  text(winner + " WINS!", width/2, 300);

  text("PRESS SPACE TO PLAY AGAIN", width/2, 350);

  if (keyPressed && key == ' ') {
    reset();
    gameState = 1;
  }
}


/***********************************/


void player(char moveUp, char moveDown, float playerPosX, float playerPosY) {
  
  
  // Move player up or down
  if (keyPressed && key == moveUp) {
    playerPosY -= playerSpeed;
  } 
  else if (keyPressed && key == moveDown) {
    playerPosY += playerSpeed;
  }
  

  // Constrain player to sketch height
  if ((playerPosY + playerHeight) >= height) {
    playerPosY = (height - playerHeight);
  } 
  else if (playerPosY <= 0) {
    playerPosY = 0;
  }

  //Draw the player
  fill(255);
  rect(playerPosX, playerPosY, playerWidth, playerHeight);

  //Check for collision with gameBall
  if (ballPosX + ballRadius >= width - playerWidth || ballPosX - ballRadius <= 0 + playerWidth) {
    if (ballPosY >= playerPosY && ballPosY <= playerPosY + playerHeight) {
      collisionWithBall = true;
    }
  }
}

void gameBall() {

  ballPosX += ballSpeedX;
  ballPosY += ballSpeedY;

  if (ballPosX + ballRadius >= width) {
    winner = "Player 2";
    gameState = 2;
  } 
  else if (ballPosX - ballRadius <= 0) {
    winner = "Player 1";
    gameState = 2;
  }

  // Check for collision with height and reverse the direction of ball
  if (ballPosY >= width-ballRadius || ballPosY <= 0+ballRadius) {
    ballSpeedY = -ballSpeedY;
  }

  // Check for collision with paddle, reverse direction and increase speed
  if (ballPosX + ballRadius >= width - playerWidth || ballPosX - ballRadius <= 0 + playerWidth) {
    if (ballPosY >= playerPosY && ballPosY <= playerPosY + playerHeight) {
//      ballPosX *= -1;
      ballSpeedX = -ballSpeedX;
      println(ballPosX);
    }
  }

  //Draw the ball
  smooth();
  ellipse(ballPosX, ballPosY, ballSize, ballSize);
}

void reset() {

  //BALL
  ballSpeedX = random(-2, 2);
  ballSpeedY = 2.0;
  ballPosX = width/2;
  ballPosY = height/2;
}


