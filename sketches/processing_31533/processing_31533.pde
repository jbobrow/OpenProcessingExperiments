
import processing.opengl.*;


int p= 50;
import pitaru.sonia_v2_9.*;
void setup() {
  size(800,500,P3D);
  smooth();
  Sonia.start(this);
  frameRate (30); 
  LiveInput.start(); 
}

void draw() {
background(0);
 
float level = LiveInput.getLevel();
  //fill(100,100,level,50);
noStroke();
fill (200,216,43,level*500);
for (int p=00; p<=500; p=p+20) {
rotateZ(p);
rotateY (level);
//translate (0,0,-10);
// rect ( 300,300,300,300);
//rect (500,0,level*200,sp.y);
//rectMode(CENTER);
rotateY (level*200+PI);
//translate (0,0,0);
ellipse (500,250,100,100);
pushMatrix ();
translate (0,0,level);
fill (20+level,level,2,level*500);
rect (400,400,100,100);
//noFill ();
//strokeWeight (1+level);
//stroke (20,50,level);
fill (20,100,200,level*500);
curve (400,-100,200,-300,0,10+level,level*2,300); 
popMatrix ();   
 }
}

// Close the sound engine
public void stop() {
  Sonia.stop();
  super.stop();
}
void mousePressed (){
  saveFrame ("1.jpeg");}


