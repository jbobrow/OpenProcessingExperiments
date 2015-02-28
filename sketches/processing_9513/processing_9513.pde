
/**
 * Bouncy Bubbles. 
 * Based on code from Keith Peters (www.bit-101.com). 
 * 
 * Multiple-object collision.
 */
 
//int newNumBalls = 0;
int numBalls = 300;
 
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(640, 200);
  noStroke();
  smooth();
  colorMode (HSB);
  
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(20, 30), i, balls);
  }
}

void draw() 
{
  background(0);
  
  float yFrRate = map (mouseY, 0, height, 40, 20);
  frameRate (yFrRate);
  
  if (numBalls >= 300) {numBalls=100;}
  
    if(mousePressed && mouseButton == RIGHT){  
       numBalls = numBalls + 10; 
 }  
    if(mousePressed && mouseButton == LEFT){  
       numBalls = numBalls - 10; 
 }  

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
    
    float colX = map (mouseX, 0, width, 0, 255);
    float colY = map (mouseY, 0, height, 180, 0);
    
  if (diameter <= 23) {
      fill( colX+random(15), 200, 240, colY-30 );
  }
  else if (diameter >= 27) {
      fill( colX+colX/2+random(15), 200, 240, colY );
  }
  else {
      fill( 50+random(25), colY+30 );
  }
      ellipse(x, y, diameter, diameter);
  }
}



