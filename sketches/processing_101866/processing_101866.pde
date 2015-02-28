
/*
##
 ## Code Project for "Programming for Digital Media & Mobile Apps" course @ Coursera
 ##
 ## Author: Mateu S. <mito150€gmail.com>
 ## Sources: Processing Reference
 ##
 */


// TODO: Modo extreme: hasta que te canses, R para reiniciar.
// TODO: Modo tiempo: se juega un determinado lapso de tiempo.
// TODO: Modo puntos: primero que llegue a 10
// TODO: Modo CPU: jugar contra CPU.


float marginH, marginV, widthHalf, heightHalf;
float pBarW, pBarH, ballSize, ballSizeHalf;
float ballSpeedX = 0, ballSpeedY = 0;
float ballX, ballY;
float gameSpeed = 2;
int scoreL = 0, scoreR = 0;
boolean inPause = false;
boolean inGame = false;
String appText = "Prong!Cessing 0.1 by Mateu S.\n\n LEFT Click to Start"
+ "\nRIGHT Click Pause\nR Key to Restart";


void setup() {
  // Canvas stuff
  size(954, 545);
  background(10, 30, 50);
  smooth(8);
  rectMode(CORNER);

  // Defining sizes
  // Added the most calculated sizes, better performance i guess
  marginH = width * 0.05;
  marginV = height * 0.05;
  pBarH = height * 0.22;
  pBarW = width * 0.015;
  ballSize = height * 0.07;
  ballSizeHalf = ballSize * 0.5;
  widthHalf = width * 0.5;
  heightHalf = height * 0.5;
  ballX = widthHalf - ballSizeHalf;
  ballY = heightHalf - ballSizeHalf;
}


void draw() {
  if (!inPause) {
    background(10, 30, 50);

    displayText();
    displayBars(2);

    if (inGame) {
      // Hit right side
      if (ballX + ballSize >= width) {
        ballSpeedX *= -1;
        incrementSpeed();
        scoreL += 1;
      }
      // Hit left side
      else if (ballX <= 1) {
        ballSpeedX *= -1;
        incrementSpeed();
        scoreR += 1;
      }
      // Hit bottom
      if (ballY + ballSize >= height) {
        ballSpeedY *= -1;
        incrementSpeed();
      }
      // Hit top
      else if (ballY <= 1) {
        ballSpeedY *= -1;
        incrementSpeed();
      }

      // Hit right bar
      if (((ballX + ballSize) >= (width - marginH - pBarW)) &&
        ((ballY <= mouseY + pBarH*0.5) && (ballY + ballSize >= mouseY - pBarH*0.5)) && (ballSpeedX > 0)) {
        ballSpeedX *= -1;
      }
      // Hit left bar
      else if ((ballX <= marginH + pBarW) &&
        ((ballY <= mouseY + pBarH*0.5) && (ballY + ballSize >= mouseY - pBarH*0.5)) && (ballSpeedX < 0)) {
        ballSpeedX *= -1;
      }

      ballX += ballSpeedX * gameSpeed;
      ballY += ballSpeedY * gameSpeed;
    }
  }
}


// Stuff related to mouse buttons
void mousePressed() {
  if (mouseButton == LEFT && !inGame) {
    randomSeed(feedRandomSeed());
    ballSpeedX = random(-3, 3);
    ballSpeedY = random(-1.5, 1.5);
    inGame = true;
  }
  else if (mouseButton == RIGHT && inGame) {
    inPause = !inPause;
  }
}


void keyPressed() {
  // Do a reset
  if (key == 'R' || key == 'r') {
    inGame = false;
    inPause = false;
    scoreL = 0;
    scoreR = 0;
    gameSpeed = 1;
    ballSpeedX = 0;
    ballSpeedY = 0;
    ballX = widthHalf - ballSizeHalf;
    ballY = heightHalf - ballSizeHalf;
    background(10, 40, 60);
    displayText();
    displayBars(2);
  }
}


// Shows the text of the app
void displayText() {
  // App Text
  textSize(14);
  textAlign(CENTER);
  fill(0xFF555555);
  text(appText, widthHalf, marginV);

  // Scores
  textSize(96);
  if (scoreL > scoreR) fill(0xFF119955);
  else if (scoreL < scoreR) fill(0xFF991155);
  text(scoreL, marginH*3, marginV*4);

  if (scoreR > scoreL) fill(0xFF119955);
  else if (scoreR < scoreL) fill(0xFF991155);
  else fill(0xFF555555);
  text(scoreR, width-marginH*3, marginV*4);
}


// mode 0: fixed bars and ball
// mode 1: moveable bars, fixed ball
// mode 2: moveable bars and ball
void displayBars(int mode) {
  // Stuff for both
  fill(0xFFFFFFFF);

  if (mode == 0) {
    rect(marginH, heightHalf, pBarW, pBarH);
    rect(width-marginH, heightHalf, pBarW, pBarH);
    rect(widthHalf, heightHalf, ballSize, ballSize);
  }
  else if (mode == 1) {
    // Bars
    rect(marginH, mouseY - pBarH*0.5, pBarW, pBarH);
    rect(width - marginH - pBarH, mouseY - pBarH*0.5, pBarW, pBarH);
    // Ball
    rect(widthHalf, heightHalf, ballSize, ballSize);
  }
  else if (mode == 2) {
    // Bars
    rect(marginH, mouseY - pBarH*0.5, pBarW, pBarH);
    rect(width - marginH - pBarW, mouseY - pBarH*0.5, pBarW, pBarH);
    // Ball
    rect(ballX, ballY, ballSize, ballSize);
  }
}


// Simple increment game speed. Avoid to check everywhere...
void incrementSpeed() {
  if (gameSpeed < 10) gameSpeed += 0.1;
}


// Randomize random() LoL
long feedRandomSeed() {
  int i;
  float randomized=0;

  for (i=0; i < second(); i++) {
    randomSeed(i+second()*millis());
    randomized = random(i*345);
  }
  return (long)randomized;
}

