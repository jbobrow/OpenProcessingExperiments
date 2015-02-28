
//variable for balls
int numBalls = 12;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;


Ball[] balls = new Ball[numBalls];


void setup() 
{
  size(400, 600);
  noStroke();
  smooth();
  fill(216,93,36);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(40, 80),i, balls);
    
 ; 

}
}

void draw() 
{
  background(217,218,186);
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
  

  float vy = 5;
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
    
    float distance = dist(x,y,mouseX,mouseY);
    if (distance < 150) {
        PVector dir = new PVector(x-mouseX, y-mouseY);
        dir.normalize();
        float mag = map(distance*distance, 0.0,150.0*150.0, 10.0,0.0);
        vx += dir.x * mag;
        vy += dir.y * mag;
    }
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
    stroke(30,26,23);
    fill(216,93,36);
    ellipse(x, y, diameter, diameter);
  }
}


