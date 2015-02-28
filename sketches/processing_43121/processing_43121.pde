
float ballxPos = 320;
float ballyPos = 240;

int ballxDir =1;
int ballyDir =1;

int ballxSpeed = 3;
int ballySpeed = 3;


float paddleStart;
float paddleEnd;

String GameOver;

void setup() {

  size (640, 480);
  smooth();
}

void draw() {

  background(0);

  // Ball Creation

  ellipse(ballxPos, ballyPos, 25, 25);

  // Paddle Creation

  rect( mouseX-37.5, height-50, 75, 10);

  // Ball Motion Control

  ballxPos= ballxPos + (ballxSpeed * ballxDir);  
  ballyPos= ballyPos + (ballySpeed * ballyDir);

  if (ballxPos>width) {
    ballxDir*=-1;
  }

  if (ballxPos<0) {
    ballxDir*=-1;
  }

  if (ballyPos<0) {
    ballyDir*=-1;
  }

  // Paddle Detection


  paddleStart = mouseX - 37.5;
  paddleEnd = mouseX + 37.5;


  if (ballyPos >= height-60 

    && paddleStart < ballxPos 

    && paddleEnd > ballxPos) {

    ballyDir*=-1;
  }

  if (ballyPos > height) {

    String s = "Game Over";
    text(s, width/2-25, height/2-25, 200, 200);
    ballyDir=0;
    ballxDir=0;
  }
}


