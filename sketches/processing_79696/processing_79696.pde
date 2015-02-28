
Brick[] bricks = new Brick[140];
int brickX=0;
int brickY=0;
color c;
Paddle paddle;
Ball ball;

void setup() {
  size(400, 400);
  noCursor();
  paddle=new Paddle();
  ball=new Ball();
  c=color(0, 0, random(255));
  for (int i=0; i<140; i++) {
    bricks[i] = new Brick(brickX, brickY);
    brickX+=20;
    if (i%20==19) {
      brickX=0;
      brickY+=20;
      fill(c);
    }
  }
}


void draw() {
  background(255);
  for (int i=0; i<140; i++) {
    bricks[i].display();
  }
  paddle.display();
  ball.display();
  ball.move();

  if (ball.checkHit(ball.ballX, ball.ballY)) {
    ball.ballMY=abs(ball.ballMY)*-1;
    ball.ballMX=abs(ball.ballMX)*-1;
  }
}


class Ball {
  float ballX;
  float ballY;
  float ballMX=3;
  float ballMY=3;
boolean hit;
  Ball() {
    ballX=width/2;
    ballY=height/2;
  }
  void display() {
    fill(c);
    ellipse(ballX, ballY, 12, 12);
  }
 boolean checkHit(float ballX, float ballY){
  if(abs(mouseX-ballX)<30 && abs(ballY-380)<3) {
    return true;
  }
  else return false;
  
}
  void move() {
    ballY+=ballMY;
    ballX=ballMX+width/2;
    ballX+=ballMX;
    if (ballX>=width) {
      ballMX=abs(ballMX)*-1;
    }
    if (ballX<=0) {
      ballMX=abs(ballMX);
    }
 
    if (ballY<=0) {
      ballMY=abs(ballMY);
    }
  }
}


class Brick {
  float x, y;


  Brick(float bx, float by) {
    this.x=bx;
    this.y=by;
  }

  void display() {

    stroke(255);
    rect(x+10, y+10, 20, 20);
    
    
  }
//boolean checkHit(float bx, float by){
// if(abs(bx-ballX)<50 && abs(ball.ba380Y-by)<5) {
//    return true;
//  }
//  else return false;
//  
//}
}
class Paddle{
  float xpos;
  float ypos;
  Paddle() {
    xpos = mouseX;
    ypos = 380;
  }
  void display() {
    rectMode(CENTER);
    fill(0);

    rect(mouseX, ypos, 50, 7);
  }
}



