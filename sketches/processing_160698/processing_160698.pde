
/*
File Name: Juggle
 Author: Dylan Martin
 Paddle and ball game, balls drop from above, player gets +1 for each save
 and -1 for each miss, when score drops below zero, player loses
 */


ArrayList BallList;
Ball b;
Paddle p;
int i;
float radius;
int score;
int play = 0;
boolean over=false;

void setup() {
  size(300, 600);
  background(255);
  fill(0);
  radius=10;
  BallList = new ArrayList();
  p = new Paddle(width/2, 40, 10);
  score=0;
  textSize(20);
  frameRate(70);
}

void draw() {
  if (play%2 == 0) {
    background(255);
    stroke(0);
    text(score, 30, 30);
    if (random(100) < 2) {
      b = new Ball(random(radius, width-radius), -radius, 0, 0, 0, 0.03, radius);
      BallList.add(b);
      if (random(100)<10) b.togglePowerball();
    }

    // render list of balls
    for (i=0;i<BallList.size();i++) {
      b = (Ball) BallList.get(i);
      b.move(p);
      b.render();
    }
    // cull list of balls
    for (i=0;i<BallList.size();i++) {
      b = (Ball) BallList.get(i);
      if (b.isStale()) { 
        BallList.remove(i); 
        if (b.isPowerball()) score-=10;
        else score--;
        i--;
      }
    }
    p.render();
    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==LEFT) p.moveLeft();
        if (keyCode==RIGHT) p.moveRight();
      }
    }

    if (score<0) {
      //over=true;
      play=play+1;
    }
  }
  else if (play%2!=0) {
    background(255, 255, 0);
    fill(0, 0, 255);
    textSize(30);
    text("Game Over", 80, 300);
  }
}
/*void mousePressed() {
  play=play+1;
}
*/

class Ball {
  float x, y, vx, vy, ax, ay;
  float r;
  boolean powerball;

  Ball(float xinit, float yinit, float vxinit, float vyinit, 
  float axinit, float ayinit, float rinit) {
    x = xinit;
    y = yinit;
    vx = vxinit;
    vy = vyinit;
    ax = axinit;
    ay = ayinit;
    r = rinit;
    powerball = false;
  }

  void togglePowerball() {
    powerball=!powerball;
  }

  void move(Paddle p) {
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;
    if (p.onPaddle(x, y)) { 
      score++;
      vy = -vy; 
      y = height-radius-p.paddleHeight;
    }
  }

  void render() {
    stroke(0);
    if (powerball) fill(0, 255, 255);
    else fill(255, 0, 0);
    ellipse(x, y, 2*r, 2*r);
  }

  boolean isStale() {
    if (y>=height+r) return true;
    else return false;
  }

  boolean isPowerball() {
    return powerball;
  }
}

class Paddle {
  float x, paddleWidth, paddleHeight;
  float vx;

  Paddle(float xinit, float paddleWidthinit, float paddleHeightinit) {
    x = xinit;
    paddleWidth = paddleWidthinit;
    paddleHeight = paddleHeightinit;
    vx = 2;
  }

  void moveLeft() { 
    x -= vx; 
    if (x<=paddleWidth/2) { 
      x = paddleWidth/2;
    }
  }
  void moveRight() { 
    x += vx; 
    if (x>=width-paddleWidth/2) { 
      x = width-paddleWidth/2-1;
    }
  }
  void render() {
    stroke(0);
    fill(0, 255, 0);
    rect(x-paddleWidth/2, height-paddleHeight, paddleWidth, paddleHeight-1);
  }

  boolean onPaddle(float ballx, float bally) {
    if (ballx>=x-paddleWidth/2 && ballx<=x+paddleWidth/2 && bally+radius >= height-paddleHeight) {
      return true;
    }
    else return false;
  }
}

