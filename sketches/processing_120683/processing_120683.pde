
int numTentacle = 29;
Tent[] tentacle = new Tent[numTentacle];
int i;

int numBalls = 12;
float spring = 0.1;
float gravity = 0.03;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(640, 360); 
  noStroke();  

tentacle[0] = new Tent();

for(int i=0; i <numTentacle; i +=1)
{
  tentacle[i] = new Tent();
  tentacle[i].w= 20+(i*5);
  tentacle[i].h= 20+(i*5);
  tentacle[i].x= 50;
  tentacle[i].y= 50;

}

for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
}
void draw() { 
  background(51);
tentacle[0].render();
tentacle[0].ease();
tentacle[0].ytarget=mouseY;
tentacle[0].xtarget=mouseX;

  for (int  i =0; i < numTentacle-1; i += 1)
  {
 tentacle[i+1].render();
 tentacle[i+1].ease();
 tentacle[i+1].ytarget=(tentacle[0+i].y*29)/30;
 tentacle[i+1].xtarget=(tentacle[0+i].x*29)/30;

 
  }
  
  fill(255,0,0);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].collideTentacle();
    balls[i].move();
    balls[i].display();  
  }
  fill(255);
  }
  
  class Tent
{
float x;
float y;
float w;
float h;
float easing = 0.04;
float xtarget;
float ytarget;


void ease()
{
  float targetX = xtarget;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = ytarget;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
    
   
  }
}
void render()
{
  ellipse(this.x, this.y, this.w, this.h);
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
  
  void collideTentacle() {
    for (int i = 0; i < numTentacle; i++) {
      float dx = tentacle[i].x - x;
      float dy = tentacle[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = tentacle[i].w/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - tentacle[i].x) * spring;
        float ay = (targetY - tentacle[i].y) * spring;
        vx -= ax;
        vy -= ay;
        //others[i].vx += ax;
        //others[i].vy += ay;
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
    ellipse(x, y, diameter, diameter);
  }
}




