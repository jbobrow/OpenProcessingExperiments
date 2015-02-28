
int numBalls = 20;
float spring = 0.10;
float gravity = 0.01;
float friction = -0.09;
Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(540, 400);
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(50, 200), i, balls);
  }
}

void draw() 
{
  background(100,10,255);
  for (int i = 0; i < numBalls; i++) 
  {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
  }
}

class Ball 
{
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
  
  void move()
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width)
    {
      x = width - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0)
    {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) 
    {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) 
    {
      y = diameter/2;
      vy *= friction;
    }
  }
  
  void display() 
  {
    fill (255,255, 0);
    arc(x, y, 50, 50, -3*PI/4, 3*PI/4);
  }
}
