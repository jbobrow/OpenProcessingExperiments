
PFont score;

int mult = 1;
float ballX;
float ballY;
float speedX = 2.0;
float speedY = 2.0;
float maxSpeedX = 8.0;
float maxSpeedY = 4.5;
int directionX = 1;
int directionY = 1;
int ballSize = 6;
int RpaddleYPos, LpaddleYPos, RpaddleXPos, LpaddleXPos;
int paddleHeight = 40;
int Rscore = 0;
int Lscore = 0;
int paddleOffset = 15;
int maxScore = 7;


//AI?

float targetLP;
float LPeasing = 0.16;


void setup() {
  background(0);
  size(400 * mult, 300 * mult);
  //smooth();
  rectMode(CENTER);
  noStroke();
  score = loadFont("PONG.vlw");
  textFont(score);
  textSize (48 * mult);
  ballX = (width/2);
  ballY = (height/2);
}

void draw() {
  gameStart();
  if (millis() > 4000) {
    inGame();
  }
}

void inGame() {

  background(0);
  LPeasing = random (0.15, 0.2);

  // DRAW NET
  for (int n = 0; n <= height; n += height/12) {
    rect (width/2, n, 5 * mult, height/18);
  }

  //SCORE

  String scoreR = ""+Rscore;
  if (ballX > width-4) {
    Rscore++;
    text(scoreR, width-width/4, 40 * mult);
    delay(2000);
    background(0);
    ballX = width/2;
    ballY = height/2;
    speedX = 2.0;
    speedY = 2.0;
  }
  textSize(48);
  text(scoreR, width-width/4, 40 * mult); // RIGHT SCORE


  String scoreL = ""+Lscore;
  if (ballX < 4) {
    Lscore++;
    text(scoreL, width/4, 40 * mult);
    delay(2000);
    ballX = width/2;
    ballY = height/2;
    speedX = 2.0;
    speedY = 2.0;
  }
  textSize(48);
  text(scoreL, width/4, 40 * mult); // LEFT SCORE




  //BALL
  if ((ballX < 0)||(ballX > width)) {
    directionX = - directionX;
  }

  if ((ballY < 0)||(ballY > height)) {
    directionY = - directionY;
  }

  ballX = ballX + speedX * directionX;
  ballY = ballY + speedY * directionY;
  rect (ballX, ballY, ballSize * mult, ballSize * mult);

  // RIGHT PADDLE
  RpaddleYPos = mouseY;
  RpaddleXPos = width - paddleOffset * mult;
  rect( RpaddleXPos, RpaddleYPos, 6 * mult, paddleHeight * mult);
  if ((ballY >= RpaddleYPos - paddleHeight/2) && (ballY <= RpaddleYPos + paddleHeight/2) && (ballX >= RpaddleXPos-ballSize/2)) {
    directionX = - directionX;
    speedX += 0.5;
    speedY += 0.5;
  }

  // LEFT PADDLE
  targetLP = ballY;
  LpaddleYPos += (targetLP - LpaddleYPos) * LPeasing;
  LpaddleXPos = paddleOffset * mult;
  rect (LpaddleXPos, LpaddleYPos, 6 * mult, paddleHeight * mult);
  if ((ballY >= LpaddleYPos - paddleHeight/2) && (ballY <= LpaddleYPos + paddleHeight/2) && (ballX <= LpaddleXPos+ballSize/2)) {
    directionX = - directionX;
    speedX += 0.5;
    speedY += 0.5;
  }

  if (speedX >= maxSpeedX) {
    speedX = maxSpeedX;
  }
  if (speedY >= maxSpeedY) {
    speedY = maxSpeedY;
  }


  //println(speedX+"      "+speedY);


  //GAME OVER

  if ((Rscore >= maxScore) || (Lscore >= maxScore)) {
    gameOver();
  }
}

void gameOver() {
  background(0);
  textSize(48);
  text("GAME OVER", width/2-80, height/2);
  textSize(24);
  text("click to restart", width/2-65, height/2 + 20);
  noLoop();
}


void gameStart() {
  background(0);
  textSize(48);
  text("AZUKI PONG", width/2-80, height/2);
  textSize(24);
  text("by: Nausk!", width/2-40, height/2 + 20);
}

void mousePressed () {

  Rscore = 0;
  Lscore = 0;
  loop();
}

