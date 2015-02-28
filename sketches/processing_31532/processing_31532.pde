

Spot sp;
int p= 50;

import pitaru.sonia_v2_9.*;

void setup() {
  size(800,800,P3D);
  smooth();
  Sonia.start(this);
  sp = new Spot ();
  sp.x =20;
  sp.y =50;
  
  LiveInput.start(); 
  
}

void draw() {
  background(0);
   getMeterLevel(); 
}
  
  void getMeterLevel(){
    camera(-30.0, -200.0+mouseY,mouseX, 300.0, 300.0, 0, 
       0.0, 1.0, 0.0);
  
    float canal1 = LiveInput.getLevel();
    float canal2 = LiveInput.getLevel();
    float canal3 = LiveInput.getLevel();
    float r = canal1*300;
    float l = canal2*width; 
    float z = canal3*height; 
    

 float level = LiveInput.getLevel();
 //fill(200,100,0);
 // stroke(50,z,r,l);
 //ellipse(width/2,height/2,level*200,level*200); 
 
 for (int p=00; p<=500; p=p+20) { 
   smooth();
 translate (0,0,-10);
 fill (57,164,165,50);
 rect (400,100,level*200,sp.y);
 fill (57-z,164,l,50);
 rect (r,200,l,p);
 pushMatrix () ;
 //rotateZ (45);
 translate (300,300,z*2);
 fill (50,r,100,z);
 box (50);
 popMatrix ();
 }
}

public void stop() {
  Sonia.stop();
  super.stop();
}
class Spot {
float x,y;
}
void mousePressed (){
  saveFrame ("1.jpeg");}

