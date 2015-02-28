
import ddf.minim.*;

 Minim minim;
 AudioPlayer song;

float black = 3;
float darcy = 8;
float jerk = 200;
float siz = 60;
float space = 20;
float drone = 20;
float peanut = 1;
float butter = -1;

Ball a_ball, another_ball, onemore_ball;
 
void setup() {
  minim = new Minim (this);
  song = minim .loadFile("shiny-ding.mp3");
  size(500,500);
  smooth();
  background(255);
  a_ball = new Ball(10, 100, 1, 3.3);
  another_ball = new Ball(random(width), random(height), random(5), random(5));
  onemore_ball = new Ball(random(width), random(height), random(7), random(5));
}
 
void draw() {
 //noStroke();
 fill(255);
 rect(0,0,width,height);
 
 
 
  a_ball.update();
  another_ball.update();
  onemore_ball.update();
 
  
  a_ball.display();
  another_ball.display();
  onemore_ball.display();
 

  
}

class Ball {
  PVector loc;  
  PVector vol;  
 
  Ball(PVector l, PVector v) {
    loc = l;
    vol = v;
  }

  Ball(float x, float y, float xsp, float ysp) {
    loc = new PVector(x, y);
    vol = new PVector(xsp, ysp);
  }
  
  void update() {
    
    if ((xlocation() > width) || (xlocation() < 0)) {
      changeSpeed(new PVector(-1,1));
    }
    if ((ylocation() > height) || (ylocation() < 0)) {
      changeSpeed(new PVector(peanut, butter));
      song.loop(0);
      
    }
    loc.add(vol);
    

 
  }
 
  void display() {
    
    
    
    noStroke();
    fill(0,242,200,100);
    ellipse(loc.x,loc.y,siz,siz);
    fill(255,159,black,30);
    triangle(0,0,0,500,250,500);
    fill(205,250,darcy,30);
    triangle(0,0,500,0,250,500);
    fill(94,jerk,222,30);
    triangle(500,0,250,500,500,500);
    fill(jerk,230,80,30);
    triangle(250,0,125,250,375,250);
    fill(242,0,0,space);
    quad(0,0,500,0,500,250,0,250);
    fill(0,0,242,drone);
    quad(0,250,500,250,500,500,0,500);
    
    if (mouseY>250){
      space = 20;
      drone = 40;
      jerk = 200;
    }else{ 
      space = 40;
      drone = 20;
      black = 200;
    }
    
      
     if ((loc.x <= 0) || (loc.x >= 500) || (loc.y <= 0)) {
song.loop(0);
     

if (mouseY>250){
  siz=siz/1.2;
}else{
 siz=siz*1.2;


}



if (siz>1200){
  siz=siz/15;
}

if (siz<=5){
  siz=siz+40;
}

if (loc.y<=3){
  black = random(180,210);
}else{ black = 3;
}
if (loc.x >=500){
  jerk = random(0,20);
}else{ jerk = 200;
}

if (loc.x<=1){
  darcy = random(10,40);
}else{ darcy = 8;
}





     }

  
   
  }
 
  float xlocation() {
    return loc.x;
  }
 
  float ylocation() {
    return loc.y;
  }
 
  PVector changeSpeed(PVector a) {
    vol.mult(a);
    return vol;
  }
  
}

void stop()
{
  
  super.stop();
}



