


Ball ball1, ball2, ball3, ball4, ball5, ball6;

void setup() {
  size(400, 400);
  background(0, 200, 0);

  fill(255, 0, 0);
  ellipse(width/2, height/2, 2*width/3, 2*height/3);
  fill(0, 0, 255);
  ellipse(width/2, height/2, width/3, height/3 );
  
    ball1 = new Ball(0, height/2, 20, 2, color(20, 40, 60));
    ball2 = new Ball(0, height/6, 20, 3, color(20, 40, 60));
    ball3 = new Ball(0, height/3, 20, 4, color(20, 40, 60));
    ball4 = new Ball(0, 2*height/3, 20, 5, color(20, 40, 60));
    ball5 = new Ball(0, 5*height/6, 20, 6, color(20, 40, 60));
    ball6 = new Ball(0, height/8, 20, 7, color(20, 40, 60));
}

void draw() {
  
  background(0, 200, 0);
  fill(255, 0, 0);
  ellipse(width/2, height/2, 2*width/3, 2*height/3);
  fill(0, 0, 255);
  ellipse(width/2, height/2, width/3, height/3 );
  
  ball1.moveBall();
  ball1.displayBall();
  ball1.detectBlue();
  ball2.moveBall();
  ball2.displayBall();
  ball2.detectBlue();
  ball3.moveBall();
  ball3.displayBall();
  ball3.detectBlue();
  ball4.moveBall();
  ball4.displayBall();
  ball4.detectBlue();
  ball5.moveBall();
  ball5.displayBall();
  ball5.detectBlue();
  ball6.moveBall();
  ball6.displayBall();
  ball6.detectBlue();
 
  
}
  

  
  
  

class Ball {

  int x;
  int y;
  int rad;
  int speed;
  color ballColor;
  float distance;

  Ball(int tempx, int tempy, int temprad, int tempspeed, color tempballColor) {
    x = tempx;
    y = tempy;
    rad = temprad;
    speed = tempspeed;
    ballColor = tempballColor;
  }

  void displayBall() {

    fill(ballColor);
    ellipse(x, y, rad, rad);
  }

  void moveBall() {
    x = x+speed;

    distance = dist(width/2, height/2, x, y);

    if (x > width) {
      speed = speed*-1;
    }
    else if (x < 0) {
      speed = speed*-1;
    }
  }

  void detectBlue() {
    if (distance > width/3) {
      rad = 1;
    }
    else {
      rad = 20;
      ballColor = color(20, 40, 60);
    }
  
  if (distance < width/6) {
    rectMode(CENTER);
    ballColor = color(0, 200, 0);
    rect(x, y, rad, rad);
  }
  }
}



