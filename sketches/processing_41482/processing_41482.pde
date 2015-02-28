
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

ArrayList<Rct> rct;
boolean mve = false;

Minim m;
AudioPlayer create;
  
void setup() {
  size(700, 400);
  smooth(); 
  rectMode(CENTER);
  frameRate(100);
   
  rct = new ArrayList();
  
 m = new Minim(this); 
 create = m.loadFile("stapler.wav");
 //create.loop(0);
}
  
void draw() {
 
//fade  
  //noStroke();
  //fill(0,10);
  //rect(0,0,width,height);

background(255);

noStroke();
fill(0);
rect(350,200,30,30);
cursor(CROSS); 

  for (Rct b : rct)
  {
    b.fade();
  }
  
}
  

void mousePressed() {
  
 // println("test_Two");
   
  if (mouseButton == LEFT) {
    rct.add(new Rct(350,200));
    create.loop(0);
  }
  else if ((mouseButton == RIGHT)&&(rct.size() > 0)) {
  rct.remove(0);
  }
}
 
class Rct {
 
  float x, y;


  Rct(float inX, float inY ) {

    x = inX;
    y = inY;
    
  }

  void update() {
    
    if(dist(pmouseX, pmouseY, mouseX, mouseY) == 0){
    mve = false;
  }
   
  if(mve==true){
    x = x + (mouseX - x)/100;
    y = y + (mouseY - y)/100;
    }
  }

  void fade() {
     
    update();
   //fill(0);
   fill(170,170,170);
    rect(x, y, 10, 10);
  } 
}

void mouseMoved() {
 mve = true;   
}
 

