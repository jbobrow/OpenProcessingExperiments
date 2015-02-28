
PImage bear;
PImage bear_cry;
PImage finger;
PImage pintch;
PImage background;
int numBalls;
float spring = 0.05;
float gravity = 0.02;
float friction = -0.9;
PImage hand;
boolean clicked;
int bearW=75;
int bearH=70;
PImage bear_face;
PImage finger_small;
PImage buttons;
Ball[] balls;

void setup() 
{ 
  numBalls=5;
  balls = new Ball[numBalls];
  size(1000, 640);
  noStroke();
  smooth();
  bear=loadImage("bear_head_small.png");
  bear_cry=loadImage("bear_head_cry_small.png");
  finger=loadImage("finger.png");
  pintch=loadImage("pintch.png");
  buttons=loadImage("buttons.png");
  finger_small=loadImage("finger_small.png");
  hand=finger;
  clicked=false;
  bear_face=bear;
  background=loadImage("background_1.jpg");
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(20, 40), i, balls);
  }
  
}

void draw() 
{
  if (keyPressed == true) {
    save("bear.jpg");
  } 
  image(background,0,0);
  image(buttons,10,560);
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move(balls[i].moving,balls[i].free);
    balls[i].display(); 
    balls[i].net(); 
  }
  image(hand,mouseX,mouseY);
  

}
void mousePressed(){
  for (int i = 0; i < numBalls; i++) {
    if(mouseX>balls[i].x && mouseX<balls[i].x+bearW&& mouseY>balls[i].y && mouseY<balls[i].y+bearH)
    {
      hand=pintch;
      if(clicked==false)
      {   
       clicked=true;
       balls[i].moving=false;  
      }
    }
    if(frameCount%2==0)
    {
        hand=finger;
        balls[i].moving=true; 
        clicked=false;
    } 
  }
  if(mouseX>10 && mouseX<78 && mouseY>560 && mouseY<628)
  {
    if(numBalls<5)
    {
    numBalls++;
    }
  }
    if(mouseX>98 && mouseX<166 && mouseY>560 && mouseY<628)
  {
    if(numBalls>0)
    {
    numBalls--;
    }
  }
}
class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  boolean collide;
  boolean stop;
  boolean moving;
  boolean free;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    moving=true;
    free=true;
    stop=false;
    collide=false;
  } 
  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        this.collide=true;
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
  void net(){
    for(int i =0;i<numBalls;i++){
     if(y<mouseY && y>mouseY-30 && x<mouseX && x>mouseX-width/2)
    {
      vy=vy-0.15;
      vx=vx-random(-0.09,0.09);
      collide=true;
    }
    }
  } 
  void move(boolean moving,boolean free) {
   
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width-80) {
      x = (width-80) - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height-80) {
      y = (height-80) - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
    if(moving==false)
    {
       vy=0;
       vx=0;
       y=mouseY+20;
       x=mouseX; 
    }
  }
  
  void display() {
    fill(255, 204);
    image(bear_face,x,y);
    if(this.collide==true)
    {
      bear_face=bear_cry;
    if(frameCount%20==0)
    {
        bear_face=bear;
        this.collide=false;
    }
    }
  }
}

