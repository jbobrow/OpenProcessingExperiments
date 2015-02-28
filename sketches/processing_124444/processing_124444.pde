
int numBalls = 10;
float spring = 0.05;
float gravity = 0;
float friction = 1.1;
float xnoise = random(10);
float ynoise = random(10);
float snoise = random(10);
float step = 8;
Ball[] balls = {};

void setup() {
  size(600, 400);
  for (int i = 0; i < numBalls; i++) {
    balls = (Ball[]) append(balls, new Ball(random(width), random(height), random(30, 70), i));
  }
}

void draw() {
  background(0);
    
  for (int i = 0; i < balls.length; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display(); 
  }
}

void mouseReleased() {
 
  int l = balls.length;
  for (int i = l; i < l + numBalls; i++) {
    balls = (Ball[]) append(balls, new Ball(random(width), random(height), random(30, 70), i));
  }
  
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  color c;
 
  Ball(float xin, float yin, float din, int idin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    c = color(random(100, 255), random(100, 255), random(100, 255)); 
  } 
  
  void collide() {
    for (int i = id + 1; i < balls.length; i++) {
      float dx = balls[i].x - x;
      float dy = balls[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = balls[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - balls[i].x) * spring;
        float ay = (targetY - balls[i].y) * spring;
        vx -= ax;
        vy -= ay;
        balls[i].vx += ax;
        balls[i].vy += ay;
      }
      
    } 
  }  


  
  void move() {
    vy += gravity;
    x += vx + (noise(xnoise) - 0.5) * step;
    y += vy + (noise(ynoise) - 0.5) * step;
    xnoise += 0.01;
    ynoise += 0.01;
    if (x - diameter/2 > width) {
      x = - diameter/2;
      vx *= friction; 
    }
    else if (x + diameter/2 < 0) {
      x = width + diameter/2;
      vx *= friction;
    }
    if (y - diameter/2 > height) {
      y = - diameter/2;
      vy *= friction; 
    } 
    else if (y + diameter/2 < 0) {
      y = height + diameter/2;
      vy *= friction;
    }
  }
  
  void display() {
    noStroke();
    fill(c, 200);
    ellipse(x, y, diameter, diameter);
  }
}



