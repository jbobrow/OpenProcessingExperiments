
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import processing.opengl.*;
PeasyCam cam;

int diameter = 100;
int spatie = 2;
float j=1;
boolean omhoog = true;


void setup(){
  noSmooth();
  size(800,600,P3D);
  cam = new PeasyCam(this, 1500);  
  cam.pan(diameter,-diameter/2);
}


void draw(){
  //cam.rotateX(10);
  //translate(500*sin(frameCount),500*cos(frameCount),100);
  //box(10);
  //cam.rotateZ(.01);
  
  background(255);
  
  if(omhoog){j+=.2;}else{j-=.2;}  
  if(j>25){omhoog=false;}
  if(j<1){omhoog=true;}
  
  translate(0,0,-100*j);
  
    for(float i=1;i<100;i+=.3){
      translate(diameter*sin(i),diameter*cos(i),spatie+j);
      color c = color(i*3,170-(i*3),255-(i*3),255);
      fill(c);
      pushMatrix();
      rotateX(frameCount*PI/100);
      rotateY(frameCount*PI/100);
      rotateZ(frameCount*PI/100);
      box(50);
      popMatrix();
    }
}




