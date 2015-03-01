
int numBalls = 300;
float spring = 0.06;
float gravity = 0.07;
float friction = -0.1;
int sca = random(5, 25);
Ball[] balls = new Ball[numBalls];
 
void setup() {
  size(400, 400);
  background(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(width/2+i/20, 0, random(4, sca), i, balls);
  }
  noStroke();
}
 
void draw() {
  fill(0, 0, 0, 80);
  rect(0, 0, width, height);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();  
  }
}
 
class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  int r = random(255);
  int g = random(255);
  int b = random(255);
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
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
      fill(r, g, b);
    ellipse(x, y, diameter, diameter);
  }
}
