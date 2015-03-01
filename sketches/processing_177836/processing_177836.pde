
/* This game is based on a tutorial by Dr. Doane www.drdoane.com
 With pressing the "r" key you can restart the game.
It is written in a procedural way and I will rewrite it as an OOP */

/* Explanation for the variables, see reset function */
float ballX, ballY, ballR;
float dX, dY;
float paddleX, paddleY, paddleW, paddleH;        


void reset() {
  ballX = 20;  // start position ball
  ballY = 20;  // start position ball
  ballR = 10;  // radius ball
  dX = random(1,2); // x speed ball
  dY = random(1,2);  // y speed ball
  paddleX = width - 15;        // position the paddle 15 pixels left of the right border
  paddleY = 10; 
  paddleW = 10;  // width of the paddle 
  paddleH = 50;  // height of the paddle   
}

void setup() {
  int time = 0;
  int tempTime;
  size(400, 400);
  paddleX = width - 15;
  reset();
}


void draw() {
  background(255, 255, 255);
  fill(0, 0, 0);
  ellipse(ballX, ballY, 2*ballR, 2*ballR);
  rect(paddleX, paddleY, paddleW, paddleH);
  
  if (ballRight() > width) {
    fill(255, 0, 0, 100);
    rect(0, 0, width, height);
    noLoop();
    textSize(36);
    text("GAME OVER", 25, height/2);
    // ballX = width + 100;
    // ballY = height + 100;
    // println("ballX = ", ballX, ", ballY = ", ballY);
  }
  
  if (collision() || ballX < 0) dX = -dX;
  if (ballY > height || ballY < 0) dY = -dY;
  ballX += dX;
  ballY += dY; 
   
  
}

boolean collision() {
  boolean returnValue = false;
  if ((ballRight() >= paddleX) && (ballLeft() <= paddleX + paddleW) ) {
    if ((ballBottom() >= paddleY) && (ballTop() <= paddleY + paddleH) ) {
      returnValue = true;
    }
  }
  return returnValue;
}

float ballLeft() {
  return ballX - ballR;
}

float ballRight() {
  return ballX + ballR;
}

float ballTop() {
  return ballY - ballR;
}

float ballBottom() {
  return ballX + ballR;
}


// code based on http://processing.org/reference/keyCode.html
// Attention: Keys events are only changing the canvas while the draw loop is active.
void keyPressed() {
  if (key == 'r' || key == 'R') {
    reset();
    loop();
  }
  if (key == CODED) {
    if (keyCode == UP) {
      paddleY = paddleY - paddleH;
    }
    else if (keyCode == DOWN) {
      paddleY = paddleY + paddleH;
    }
  }
}
      
