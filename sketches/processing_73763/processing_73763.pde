
// credit to Processing's bouncy balls example


int H = hour();
int M = minute();
int S = second();

float spring = .001;
float gravity = 0.001;
float friction = -0.9;
Ball[] secondBalls = new Ball[60];
Ball[] minuteBalls = new Ball[60];
Ball[] hourBalls = new Ball[24];

void setup(){
  size(900,600);
  noStroke();
  for (int i = 0; i < 60; i++) {
    secondBalls[i] = new Ball(random(width), 0, 10, i, 255, 
    map(i, 0.0, 60.0, 0, 255.0), i, 60, secondBalls);
    }
  for (int i = 0; i < 60; i++){
    minuteBalls[i] = new Ball(random(width), random(height), 40, i, map(i, 0, 60, 140, 0), 
    0, map(i, 0.0, 60.0, 100, 255), 60, minuteBalls);
    }  
  for (int i = 0; i < 24; i++){
    hourBalls[i] = new Ball(random(width), random(height), 70, i, map(i, 0.0, 24, 50, 0), 
    map(i, 0.0, 24, 230, 0), map(i, 0.0, 24, 255, 0), 24, hourBalls);
    }
  }
 
void draw(){
  background(255);
  fill(0);
  H = hour();
  M = minute();
  S = second();
  
  for (int i = 0; i < S; i ++){
    secondBalls[i].collide();
    secondBalls[i].move();
    secondBalls[i].display();
    
  }
  
  for (int i = 0; i < M; i++){
    minuteBalls[i].collide();
    minuteBalls[i].display();
    minuteBalls[i].move(); 
  }
   
  for (int i = 0; i < H; i++){
    hourBalls[i].collide();
    hourBalls[i].display();
    hourBalls[i].move(); 
  }
/*  
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();  
  }
*/ 
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  float r, g, b;
  int id;
  int arraySize;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, float ir, float ig, float ib, int iarraySize, Ball[] oin) {
    x = xin;
    y = yin;
    r = ir;
    g = ig;
    b = ib;
    arraySize = iarraySize;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    for (int i = 0; i < arraySize; i++) {
      if(id != i){
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
    fill(r, g, b, 150);
    ellipse(x, y, diameter, diameter);
  }
}
