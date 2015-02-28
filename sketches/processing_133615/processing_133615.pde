
int numBalls = 100;
float spring = .8;
float gravity = 0;
float friction = 0;


Ball[] balls = new Ball[numBalls];

void setup() {
  size(720, 360);
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width * 3), random(height * 2), random(10, 30), i, balls);
  }
  
}

void draw() {
  fill(#08031A,10);
  rect(0,0,width,height);

  
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
  float angle;
    float jitter;
  Ball[] others;
 
  Ball(float theX, float theY, float diam, int idiam, Ball[] theO) {
    x = theX;
    y = theY;
    diameter = diam;
    id = idiam;
    others = theO;
    
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
    if (second() % 2 == 0) {  
      jitter = random(-.1, .1);
    }
    angle = angle + jitter;
    float c = sin(angle);
    translate(0, 0);
    rotate(c);   
    
    ellipse(x, y, diameter/2, diameter/2);
    noStroke();
    fill(random(0,255), random(0,255), random(0,255));
  }
}


