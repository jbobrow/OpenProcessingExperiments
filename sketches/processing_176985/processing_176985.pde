
int numBalls = 68;
float spring = 0.001;
float gravity = 0.001;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
 
void setup() {
  size(600, 360);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random (12, 15), i, balls);
  }
  noStroke(0);
  fill(109, 171, 252);
}
 
void draw() {
  background(154, 255, 215);
  for (Ball ball : balls) {
    ball.collide(20, 120);
    ball.move();
    ball.display(); 
  }
}
 
class Ball {
   
  float x, y;
  float diameter;
  float vx = 3;
  float vy = 0;
  int id;
  Ball[] others;
  
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }
   
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
   
  void move() {
    vy += gravity;
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
    else if (y - diameter/4 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
   
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}

