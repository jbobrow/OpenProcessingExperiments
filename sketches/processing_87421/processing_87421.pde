

int numBalls = 62;
float spring = 0.25;
float gravity = 0.000004;
float friction = -0.4;
Ball[] balls = new Ball[numBalls];
int ballCount = 7000;
int ballSize = 10;
int ballSpeed = 20;
float[]xspeed = new float[ballCount];
float[]yspeed = new float[ballCount];
float[]xpos = new float[ballCount];
float[]ypos = new float[ballCount];
float[]wdth = new float[ballCount];
float[]ht = new float[ballCount];
int[]colors = new int[ballCount];
float bcolor;


void setup() {
  size (600,600);
  
   
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
for (int p = 0; p < ballCount; p++) {
    xspeed[p] = random(1, ballSpeed);
    yspeed[p] = random(-ballSpeed, ballSpeed);
    wdth[p] = random(1, ballSize);
    ht[p] = wdth[p];
    xpos[p] = width/2+random(-width/20, width/20);
    ypos[p] = height+random(-height/20, height/20);
    colors[p] = color(random(255), random(255), random(255));
    fill(colors[p]);
}

  }}
   void draw()
{
  
   colorMode(HSB, 359, 99, 99);
  background(bcolor, 88, 93);
  bcolorx();

 
  {
   // strokeWeight(10);
   // stroke(26,255,0,10);
   // line(random(height),random(width),0,320);
  }
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display(); 
  }
  for (int p = 0; p < ballCount; p++) {
    fill(colors[p]);
    ellipse(xpos[p], ypos[p], wdth[p], ht[p]);
    xpos[p]+=sin(p)*xspeed[p];
    ypos[p]+=cos(p)*yspeed[p];
   
    if (xpos[p]+wdth[p]/2>=width || xpos[p]<=wdth[p]/2) {
      xspeed[p]*=-1;
    }
    if (ypos[p]+ht[p]/2>=height || ypos[p]<=ht[p]/2) {
      yspeed[p]*=-1;
  
}



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
    fill(255, 204);
    ellipse(x, y, diameter, diameter);
  }
}
void bcolorx() {
  if (bcolor > 359) {
    bcolor = 0;
  }
  if (bcolor >= 0) {
    bcolor += 5;
  }
}



