
//float xspeed = 5;
//float yspeed = 6;
//float x = 0;
//float y = 0;
color ballColor;
float ballR,ballG,ballB;
float colorFactor = .31875;
//boolean hitedge = false;
boolean paused = false;
int MAXBALLS = 100;
Ball[] balls = new Ball[MAXBALLS];
int numballs = 0;


void setup() {
  background(255);
  size(400,400);
  smooth();
  stroke(128);
  noStroke();
}

void draw() {
  for(int i = 0; i< numballs; i++) {
    moveBall(i);
    bounceBall(i);
    colorBall(i);
    drawBall(i);  
  }
  //background(255);
}

void mousePressed() {
  float xspeed = random(3,5);
  float yspeed = random(3,5);

  balls[numballs] = new Ball(mouseX,mouseY,ballColor,xspeed,yspeed);
  numballs++;
  //println("created a new ball at "+mouseX+","+mouseY);
  //println("total balls = "+numballs);
}

void moveBall(int i) {
  balls[i].x = balls[i].x + balls[i].xspeed;
  balls[i].y = balls[i].y + balls[i].yspeed;
}

void bounceBall(int i) {
  if(balls[i].x > width || balls[i].x < 0) {
    balls[i].xspeed = balls[i].xspeed * -1;
    balls[i].hitedge = true;
  }
  if(balls[i].y > height || balls[i].y < 0) {
    balls[i].yspeed = balls[i].yspeed * -1;
    balls[i].hitedge = true;
  }
}

void colorBall(int i) {
  if(balls[i].hitedge) {
    balls[i].hitedge = false;
    ballR = random(255);
    ballG = random(255);
    ballB = random(255);
    ballColor = color(ballR,ballG,ballB);
   // background(ballColor);
  }
}

void drawBall(int i) {
  fill(ballR,ballB,ballG);
  //println("drawing ball "+i+" at "+balls[i].x+","+balls[i].y);
  ellipse(balls[i].x,balls[i].y,20,20);
}

class Ball {
  float x;
  float y;
  color c;
  float xspeed;
  float yspeed;
  boolean hitedge = false;

  Ball(float x_, float y_, color c_, float xspeed_, float yspeed_) {
    x = x_;
    y = y_;
    c = c_;
    xspeed = xspeed_;
    yspeed = yspeed_;
  }

}


