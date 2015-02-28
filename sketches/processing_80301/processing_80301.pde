
import controlP5.*;
PGraphics pg;
ControlP5 controlP5;
float Distance;
int numBalls = 20;
int blur = 50;
float Size;
float spring = 0.05;
float gravity = 1;
float friction = -0.9;
//int Saturation;
Ball[] balls = new Ball[numBalls];

void setup() 
{
  size(450, 360);
  background(255);
  noStroke();
  controlP5 = new ControlP5(this);
 // addKnob("k1",10,150,10,150,50).setLabel("50");
 controlP5.addSlider("Size",1,30,1,50,30,160,10);
   controlP5.addSlider("Distance",0,1.5,0,50,50,160,10);
   controlP5.addSlider("gravity",0.01,1,1,50,70,160,10);
    controlP5.addSlider("blur",5,80,50,50,90,160,10);
   
    controlP5.controller("Size").setColorActive(#80C620);
    controlP5.controller("Distance").setColorActive(#80C620);
    controlP5.controller("gravity").setColorActive(#80C620);
    controlP5.controller("blur").setColorActive(#80C620);
      controlP5.setColorForeground(#70B216);
      controlP5.setColorBackground(0);
      controlP5.setColorLabel(color(50));
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width/2-20,width/2+20), random(height/2), random(5, 40), i, balls);
  }
  smooth();
}

void draw() 
{
 // background(255);
//  rect(20,20,420,320);
  for (int i = 0; i < numBalls; i++) {
    balls[i].move();
    balls[i].display();  
    if(Distance > 0){
       balls[i].collide();
    }
    if (gravity < 1){
      balls[i].collide();
      
  }
}
       fill(255,blur);
  rect(0,0,width,height);
  gui();
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
      float distance = sqrt(dx*dx + dy*dy)/Distance;
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
    if (x + diameter/2 > 400) { //400=width
      x = 400 - diameter/2;
      vx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > 300) { //300=height
      y =300 - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
   
  }
 
  void display() {
    fill(255);
 ellipse(x, y, Size+diameter/1.1, Size+diameter/1.1);
     fill(#B2DE24, 200);
 ellipse(x, y, Size+diameter*1.1, Size+diameter*1.1);
 fill(#D7DE24, 200);
 ellipse(x, y, Size+diameter, Size+diameter);
 fill(#E0E81C, 150);
 ellipse(x, y, Size+diameter/1.3, Size+diameter/1.3);
 fill(255,50);
 ellipse(x-6, y-6, Size+diameter/1.5, Size+diameter/1.5);
  }
}
void gui() {
 //  cam.beginHUD();
   controlP5.draw();
// cam.endHUD();
   updateUI();

 }
void updateUI(){
Size=(int)controlP5.controller("Size").value();
Distance=controlP5.controller("Distance").value();
gravity=controlP5.controller("gravity").value();
blur=(int)controlP5.controller("blur").value();
}

