
int numBalls = 3;
float spring = 0.1;
float gravity = 0.03;
float friction = -1;
Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(640, 800);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    fill(255, random (255), random (255));
    balls[i] = new Ball(random(width), random(height), random(20, 40), i, balls);
   
  }
}

void draw() 
{
  background(234, 33, 232);
  for (int i = 0; i < numBalls; i++) {

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
    fill(255, 204);
    ellipse(x, y, diameter, diameter);
  }

}


