
import processing.opengl.*;

float ang;
int limit=600;
int i=1;
float a=width/2;
float b=height/2;
float c;

void setup(){
  size(800,550,OPENGL);
  background(0);
  a=width/2;
  b=height/2;
  c=0;

 frameRate(30);
}

void draw(){
  
  background(0);
  fill(200);
  ambientLight(127,255,255);
  translate(a,b,c);
  rotateX(radians(i));
  rotateY(radians(i));
  smooth();
  sphere(150);
  i++;
}
  


void mousePressed(){
  a=mouseX;
  b=mouseY;
  c=0;
}

void mouseDragged(){
  a=mouseX;
  b=mouseY;
  c=c+2;
  
}

void mouseReleased(){
  a=mouseX;
  b=mouseY;
  }
 
  

