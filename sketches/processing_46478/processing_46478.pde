
PImage road;


float r;
float g;
float b;
float a;
  
float diam;
float x;
float y;

int numBalls =6000;
float spring = .1;
float gravity = .05;
float friction = -1;
Ball[] balls = new Ball[numBalls];



void setup()
{

  size(800,600);
  background(100);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(1, 1.2), i, balls);
   
     }
     
  road = loadImage("road.jpg");
  

  
}
   
void draw() {
   
  r = random(200);
  g = random(200);
  b = random(200);
  a = random(200);
 diam = random(200);
  x = random(800);
  y = random(300);
   
  noStroke();
  fill(255,230,200,a);
  ellipse(x, y, 100, 100);
  
fill(65,77,118,20);
rect(0, 0, 800, 80);

  tint(mouseX,mouseY,255,10);
  image(road,0,0,800,600);


  
  //background(155, 120);
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
    if (x + diameter/5 > width) {
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




