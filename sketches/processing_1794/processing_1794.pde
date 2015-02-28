
/**
 * Bouncy Bubbles. 
 * Based on code from Keith Peters (www.bit-101.com). 
 * 
 * Multiple-object collision.
 */
 
 
int numBalls = 16;
float spring = 1.9;
float gravity = 0.0;
float friction = 0.5;
float col_factor01 = random (300,1000);
float col_factor02 = random (300,1000);

PFont fontA;

Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(440, 440);
  noStroke();
  smooth();
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(20, 40), i, balls);
  }
}

void draw() 
{
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
  float vx = random (-1,1);
  float vy = random (-1,1);
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
   float col01 = abs (vx) * col_factor01;
   float col02 = abs (vy) * col_factor02; 
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
      // Set the font and its size (in units of pixels)
      /* textFont(fontA, 32);
      fill(255);
      text(vx,x, y);
      text(vy,x,y+30); */

    
  }
  
  /* red */
   

    
    void display() {
    float col01 = abs (vx) * col_factor01;
    float col02 = abs (vy) * col_factor02;
    float col03 = 150;
    fill(col01,col02,col03,255);
    ellipse(x, y, diameter, diameter);
    }
}

