
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="dm.png,wood_textures.jpg,mask0.png,mask1.png,mask2.png,mask3.png,mask4.png,mask5.png,mask6.png,mask7.png,mask8.png"; */ 

int numBalls = 9;
PImage background;
PImage dm;
PImage img[] = new PImage[numBalls];

//Initialize constants
float spring = 0.05;
float gravity = 0;
float gravityWii = 0;
float friction = 0;
int imageSize = 100;
int xChange = 0;
int yChange = 0;
int tinty = 255;
Ball[] balls = new Ball[numBalls];
/*
  int posX[] = {100, 350, 600, 100, 350, 600, 100, 350, 600};
int posY[] = {550, 550, 550, 300, 300, 300, 50, 50, 50};
*/


void setup() {
  //Canvas size and background
  size(800, 700);
  /*
background = loadImage("wood_textures.jpg");
    dm = loadImage("dm.png");
  
  */

 
  //background(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(100,100,100, i, balls);
 /*img[i] = loadImage("mask"+i+".png");
 */
 }
  noStroke();
  

}

void draw() {
  /*
 image(background,0,0, 800, 700);
   
    image(dm,width/2-60,height/2-60, 120, 120);
  
    tint(255, tinty);  
    */
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
        
       // oscP5.send(new OscMessage("/collision").add(id), puredata);
        
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

     
 /*    
     if(gravityWii > 0.003){
        y += (vy + xChange);
     
     x += (vx + xChange);
     
      if(x < 400 && xChange<0){
     y += (vy + xChange);
     
     x += (vx + xChange);
     
     }
          if(x < 400 && xChange>0){
     y += (vy + xChange);
     
     x += (vx + xChange);
     
     }
          if(x < 400 && xChange<0){
     y += (vy + xChange);
     
     x += (vx - xChange);
     
     }
       if(x > 400 && xChange>0){
     y += (vy - xChange);
      x += (vx - xChange);
     }
 
     gravity = 0.007;
     spring = 0.07;
     friction = -0.002*(gravity+gravityWii);
    vy += gravity*-10;
        
    if (second() % 4 == 0) {
     x += (vx + random(-5,5));
     y += (vy + random(-5,5));
   tinty = 164;
     }
     }
     else {
       vy += gravity;
            tinty = 255;
     }
         */
     
     if (mousePressed) {
    
     spring = 0.07;
     gravity = 0.007;
     friction = -0.002;
     tinty = 225;
     x += (vx + random(-10,10));
     y += (vy + random(-10,10));
     vy += gravity*-10;
   } else {
     vy += gravity;
     tinty = 255;
   }
  
    
    x += vx;
    y += vy;
    if (x + diameter > width) {
      x = (width - diameter);
      //vx *= -friction; 
      vx = -vx/2;
    }
    else if (x < 0) {
      x = 0;
      //vx *= -friction;
      vx = -vx/2;
    }
    if (y + 150 > height) {
      y = height - 150;
      //vy *= -friction;
     vy = -vy/5; 
    } 
    else if (y < 0) {
      y = 0;
      //vy *= -friction;
      vy = -vy/2;
    }
  }
  void display() {
      ellipse(x, y, diameter, diameter);
   
   // image(img[i], x, y, imageSize, imageSize/2*3);
  

}
}

/*
void oscEvent(OscMessage oscm) {
  
  if (oscm.checkAddrPattern("/gravity")) {
 
    if (oscm.checkTypetag("f"))
      gravityWii = oscm.get(0).floatValue();
     
    else
      gravityWii = oscm.get(0).intValue();

  }
  
    if (oscm.checkAddrPattern("/xy")) {
 
    if (oscm.checkTypetag("ii")){
      xChange = oscm.get(0).intValue();
      yChange = oscm.get(1).intValue();
    }

  }
  
  
    }
*/
