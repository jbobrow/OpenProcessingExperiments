
int numBalls = 700;
float spring = 0.005;
float gravity = 0.03;
float friction = -0.5;
Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(500, 800);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(5, 15), i, balls);
  }
}

void draw() 
{
  background(85,52,19);
  for (int i = 0; i < numBalls; i++) {
  if (mousePressed)  {
      balls[i].collide();
      balls[i].collect();
      balls[i].display();  
  } else  {
      balls[i].collide();
      balls[i].move();
      balls[i].display(); 
  }
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
    vy -= gravity;
    y = y - .25;
    if (y < 0) {
      y = height;
    }
    x += vx/2;
    y += vy/2;
  }
  
  void collect() {
    vy -= gravity;
    x += vx;
    y += vy;
    if (x + diameter > width) {
      x = width - diameter;
      vx *= friction; 
    }
    else if (x - diameter < 0) {
      x = diameter;
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
    fill(255, 204);
    ellipse(x, y, diameter, diameter);
  }
}

