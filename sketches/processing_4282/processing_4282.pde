
//startby Bouncy bubbies

int numBalls = 20;
float spring = 0.01;
float gravity = 0;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];
PImage bg;

void setup() 
{
  bg = loadImage("111.jpg");
  size(400, 600, P3D);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random (255), random (255), random (255), random(width), random(height), random(40, 100), i, balls);
  }
}

void draw() 
{
  background(bg);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
  }
}

class Ball {
  float redcol;
  float greencol;
  float bluecol;
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float redcolin, float greencolin, float bluecolin, float xin, float yin, float din, int idin, Ball[] oin) {
    redcol = redcolin;
    greencol = greencolin;
    bluecol = bluecolin;
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
        vy -= ay;  // change MY direction
        redcol = random(255);  //change MY col
        greencol = random(255);
        bluecol = random(255);
        others[i].vx += ax;   // change the other one's direction
        others[i].vy += ay;
        others[i].redcol = random(255);  //change the other ones colour
        others[i].greencol = random(255);
        others[i].bluecol = random(255);
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
    fill (redcol, greencol, bluecol);
    ellipse(x, y, diameter, diameter);
  }
}

