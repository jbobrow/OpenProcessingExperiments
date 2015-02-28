
/* 
Credit to Michael Blakie
Credit to Michael Blakie
Credit to Michael Blakie
Credit to Michael Blakie
*/
int numBalls = 20;
float spring = 0.3;
float gravity = 0.3;
float friction = -0.9;

Ball[] balls = new Ball[numBalls];

void setup() {
  background(0);
  size(640, 360);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  noStroke();
  fill(255, 204);
}

void draw() {
  //  background(0); LEAVE THIS AS A COMMENT
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
}



void keyPressed() {
  background(0);
}


//below is the ball class. GOOD LUCK UNDERSTANDING IT! XD
class Ball {

  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;


  float ballR = random(0, 255);
  float ballG = random(0, 255);
  float ballB = random(0, 255);

  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = random(1, 15);
    id = idin;
    others = oin;
  } 


//When they collide (ball->wall & ball->ball)
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }
  }


//This is the ball MOVE function
  void move() {
    vy += random(-0.1, 0.1);
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
//this function below edits all the balls. DONT CHANGE THIS!
  void display() {
    ellipse(x, y, diameter, diameter);
    fill(ballR, ballG, ballB);
  }
}

