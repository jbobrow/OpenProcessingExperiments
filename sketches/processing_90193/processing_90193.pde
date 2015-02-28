
int ballA = 15;
int ballX = ballA;
int ballY = 10;
float paddleX;
float paddleY = 25;           
float paddleB = 25;
float paddleA = 150;
int AX = 5;
int AY = 5;
int score = 0;
void setup() {
  size(800,500);
  stroke(255,255,0);
  paddleX = 650;
}
void draw() {
  background(133,32,158);
  fill(255,225,0);
  rect(paddleX, paddleY, paddleB, paddleA);
    fill(0,225,0);
  ellipse(ballX, ballY, ballA*2, ballA*2);
  if (C () || ballX < 0) {
    AX *= -1;
  }
  if (ballY >= height-ballA || ballY <= 0) {
    AY *= -1;
  }
  ballX= ballX + AX;
  ballY= ballY + AY;
 
  if(keyPressed == true) {
    if (key == CODED) {
      if(keyCode == UP) {
        if (paddleY >= 0) {
          paddleY = paddleY - paddleA*0.1;
        }
      }
      if(keyCode == DOWN) {
        if(paddleY <= height - paddleA) {
          paddleY = paddleY + paddleA*0.15;
        }
      }
    }
  } 
}
boolean C() {
  boolean C = false;
  if ((ballX >= paddleX) && (ballX <= paddleX + paddleB)) {
    if ((ballY >= paddleY) && (ballY <= paddleY + paddleA)) {
      C = true;
    }
  }
  return C;
} 
boolean D() {
  boolean D = false;
  if (ballX > paddleX) {
    D = true;
  }
  return D;
}

void R() {
  ballX = ballA;
  ballY = 40;
  paddleY = 8;
  score = 0;
}



