
int numBalls = 200;
float spring = 0.05;
float friction = -0.9;

Ball[] balls = new Ball[numBalls];

void setup() {
  size(500, 500);
  colorMode(HSB,360,100,100,100);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), 8, i, balls);
  }
 
}

void draw() {
  background(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
  }
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
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
    
        float ax = (x - mouseX) * spring*0.005;
        float ay = (y - mouseY) * spring*0.005;

        vx -= ax;
        vy -= ay;
      
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

    strokeWeight(3);
    stroke(random(360),80,100,8);
      line(x,y,mouseX,mouseY);
    noStroke();

  }
}
