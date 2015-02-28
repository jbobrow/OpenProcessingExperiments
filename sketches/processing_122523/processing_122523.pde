
Tent tip;
Tent body1;
Tent body2;
Tent body3;
Tent body4;
Tent body5;
Tent body6;
Tent body7;
Tent body8;
Tent body9;
Tent body10;
Tent body11;
Tent body12;
Tent body13;
Tent body14;
Tent body15;
Tent body16;
float x; 
float y;
int numBalls = 20;
Ball[] balls = new Ball[numBalls];
float spring = 0.8;
float gravity = 0.02;
float friction = -0.;


 
void setup() {
  size(640, 480);
  noStroke(); 
tip= new Tent();
tip.x=60;
tip.y=60;
tip.w=20;
tip.h=20;
body1= new Tent();
body1.x=60;
body1.y=60;
body1.w=25;
body1.h=25;
body2= new Tent();
body2.x=60;
body2.y=60;
body2.w=30;
body2.h=30;
body3= new Tent();
body3.x=60;
body3.y=60;
body3.w=35;
body3.h=35;
body4= new Tent();
body4.x=60;
body4.y=60;
body4.w=40;
body4.h=40;
body5= new Tent();
body5.x=60;
body5.y=60;
body5.w=45;
body5.h=45;
body6= new Tent();
body6.x=60;
body6.y=60;
body6.w=47.5;
body6.h=47.5;
body7= new Tent();
body7.x=60;
body7.y=60;
body7.w=50;
body7.h=50;
body8= new Tent();
body8.x=60;
body8.y=60;
body8.w=52.5;
body8.h=52.5;
body9= new Tent();
body9.x=60;
body9.y=60;
body9.w=60;
body9.h=60;
body10= new Tent();

 for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
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
    ellipse(x, y, diameter, diameter);
  }
}
 /*
void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx); 
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}
 
void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

 */
 
 
void draw() {
  background(51);
  fill(random(225),random(225),random(225));
  tip.render();
  tip.ease();
  tip.ytarget=mouseY;
  tip.xtarget=mouseX;
  tip.ease2();
  tip.y2target=(body1.y*590)/600;
  tip.x2target=(body1.x*590)/600;
  body1.render();
  body1.ease();
  body1.ytarget=(tip.y*590)/600;
  body1.xtarget=(tip.x*590)/600;
  body1.ease2();
  body1.y2target=(body2.y*590)/600;
  body1.x2target=(body2.x*590)/600;
  body2.render();
  body2.ease();
  body2.ytarget=(body1.y*590)/600;
  body2.xtarget=(body1.x*590)/600;
  body2.ease2();
  body2.y2target=(body3.y*590)/600;
  body2.x2target=(body3.x*590)/600;
  body3.render();
  body3.ease();
  body3.ytarget=(body2.y*590)/600;
  body3.xtarget=(body2.x*590)/600;
  body3.ease2();
  body3.y2target=(body4.y*590)/600;
  body3.x2target=(body4.x*590)/600;
  body4.render();
  body4.ease();
  body4.ytarget=(body3.y*590)/600;
  body4.xtarget=(body3.x*590)/600;
  body4.ease2();
  body4.y2target=(body5.y*590)/600;
  body4.x2target=(body5.x*590)/600;
  body5.render();
  body5.ease();
  body5.ytarget=(body4.y*590)/600;
  body5.xtarget=(body4.x*590)/600;
  body5.ease2();
  body5.y2target=(body6.y*590)/600;
  body5.x2target=(body6.x*590)/600;
  body6.render();
  body6.ease();
  body6.ytarget=(body5.y*590)/600;
  body6.xtarget=(body5.x*590)/600;
  body6.ease2();
  body6.y2target=(body7.y*590)/600;
  body6.x2target=(body7.x*590)/600;
  body7.render();
  body7.ease();
  body7.ytarget=(body6.y*590)/600;
  body7.xtarget=(body6.x*590)/600;
  body7.ease2();
  body7.y2target=(body8.y*590)/600;
  body7.x2target=(body8.x*590)/600;
  body8.render();
  body8.ease();
  body8.ytarget=(body7.y*590)/600;
  body8.xtarget=(body7.x*590)/600;
  body8.ease2();
  body8.y2target=(body9.y*590)/600;
  body8.x2target=(body9.x*590)/600;
  body9.render();
  body9.ease();
  body9.ytarget=(body8.y*590)/600;
  body9.xtarget=(body8.x*590)/600;
  body9.ease2();
  body9.y2target=(body10.y*590)/600;
  body9.x2target=(body10.x*590)/600;
  
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }

   
  if (tip.isOverlappingMouse() == true)
  {
    tip.x-=5;
    tip.y-=5;
  }
 
 
  }
   
  class Tent
{
float x;
float y;
float w;
float h;
float easing = 0.08;
float xtarget;
float ytarget;
float x2target;
float y2target;
float easing2= 0.03;
float rotation = 0.0;
float s = 1.0;
 
 
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
  boolean isOverlappingMouse()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
 

 
 
void render()
{
  ellipse(this.x, this.y, this.w, this.h);
}
 
}



