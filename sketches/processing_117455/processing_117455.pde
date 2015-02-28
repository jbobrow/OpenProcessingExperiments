
//Varialble
int ballA = 15;//ball size
int ballX = ballA;
int ballY = 40;
 
float paddleX;
float paddleY = 8;           
float paddleB = 8;
float paddleA = 150;//padle size
 
int AX = 5;//speed
int AY = 5;//speed
 
int score = 0;
 
//setup
void setup() {
  size(800,600);//screen size
  smooth();
  noStroke();
  paddleX = 790;//placement of paddle on the screen
}
 
 
//draw paddle and ball
void draw() {
  background(92);
  fill(255,225,0);//color paddle
  rect(paddleX, paddleY, paddleB, paddleA);//paddle
    fill(225);
  ellipse(ballX, ballY, ballA*2, ballA*2);
  
  if (C () || ballX < 0) {
    AX *= -1;
  }
  if (ballY >= height-ballA || ballY <= 0) {
    AY *= -1;
  }
  ballX= ballX + AX;
  ballY= ballY + AY;
   
//paddle movement
  if(keyPressed == true) {
    if (key == CODED) {
      if(keyCode == UP) {
        if (paddleY >= 0) {
          paddleY = paddleY - paddleA*0.25;
        }
      }
      if(keyCode == DOWN) {
        if(paddleY <= height - paddleA) {
          paddleY = paddleY + paddleA*0.25;
        }
      }
    }
  }
 
//score
  fill(255,225,0);
  textSize(50);
  text(score, 25, 50);
  score();
 
 
 
  if ( D ()) {
    R();
  }
}
 
 
//ball and paddle
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
 
 
//score
void score() {
  if (C ()) {
    score = score + 1;
  }
}
 
 
 
void R() {
  ballX = ballA;
  ballY = 40;
  paddleY = 8;
  score = 0;
}



