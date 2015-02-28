
Tent[] tentacle = new Tent[40];
int i;
int num;
float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 200;
int numBalls = 6;
float spring = 0.1;
float gravity = 0.03;
float friction = -0.9;
int numTentacle = 39;
float timer;
float stimer;
float timer3;
Tent endtent;
PImage bac;
PImage mouth;
PImage butts;

Ball[] balls = new Ball[numBalls];

void setup() {
  size(500, 500); 
  bac = requestImage("iamtired.png");
  mouth = requestImage("mouthend.png");
  butts = requestImage("fartwin.png");
  noStroke();  
tentacle[0] = new Tent();
for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  endtent = new Tent();
  endtent.w = 40;
  endtent.h = 40;


for(int i=0; i <39; i +=1)
{
  tentacle[i] = new Tent();
  tentacle[i].w= 15+(i/2);
  tentacle[i].h= 15+(i/2);
  tentacle[i].x= 50;
  tentacle[i].y= 50;

}
}
void draw() { 
  image(bac,0,0,width,height);
  stimer+= 0.0167;
  timer3+= 0.0167;
  if (stimer>=2)
  {
  timer += 0.0167;
  }
  tentacle[0].render();
  tentacle[0].ease();
  tentacle[0].xtarget=mouseX;
  tentacle[0].ytarget=mouseY;
  endtent.render();
  endtent.ease();
  endtent.xtarget=(tentacle[18].x*59)/60;
  endtent.ytarget=(tentacle[18].y*59)/60;
if (health < 25)
  {
    fill(255, 0, 0);
  } 
  else if (health < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  noStroke();
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(20, 20, drawWidth, 10);

  stroke(0);
  noFill();
  rect(20, 20, rectWidth, 10);
  if (timer>=2)
  {
    health-=25;
    timer=0;
  }

  for (int  i =1; i < 19; i += 1)
  {

    fill(137,58,58);
 tentacle[i].render();
 tentacle[i].ease();
 tentacle[i].xtarget=(tentacle[i-1].x*59)/60;
 tentacle[i].ytarget=(tentacle[i-1].y*59)/60;
  }

  for (int i = 0; i < 6; i++) {

        balls[i].display(); 
    balls[i].collide();
    balls[i].collideTentacle();
    balls[i].move();
    if(balls[i].isOverlapping(endtent))
    {
      health+=15;
      balls[i].x = random(500);
      balls[i].y = random(500);
    }
    
    if(health<0)
    {
      image(mouth,0,0,width,height);
      timer3 -= 0.0167;
    }
    if(timer3>=20)
    {
      image(butts,0,0,width,height);
      health=100000;
    }
    
    
    
    
  }


  
  
  
  
  
  }
  
  class Tent
{

  float s = 1.0;

float x;
float y;
float w;
float h;
float easing = 0.15;
float xtarget;
float ytarget;
float x2target;
float y2target;
float easing2= 0.02;
float num;

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
void ease2()
{
  float targetX2 = x2target;
  float dx2 = targetX2 - x;
  if(abs(dx2) > 1) {
    x += dx2 * easing2;
  }
  
  float targetY2 = y2target;
  float dy2 = targetY2 - y;
  if(abs(dy2) > 1) {
    y += dy2 * easing2;
    
   
  }
}
void render()
{
  ellipse(this.x, this.y, this.w, this.h);
}
     



}



class Ball extends Tent
{
  
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


boolean isOverlapping(Tent other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);   
     
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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
    fill(105,214,35);
    ellipse(x, y, diameter, diameter);

  }
}




