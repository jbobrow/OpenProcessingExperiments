
//December 15th 2009
//EasySphere v1.0


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
void setup(){
 size(300,300,P3D); 
background(255);  
cam= new PeasyCam (this,width);
}

void draw(){
  translate(-width/2,-height/2);
  background(255); 
 for (float z=0;z<360;z+=0.1){ //0.01 to increase resolution
   translate(width/2,height/2,0);
   rotateX(z);
   //line(0,0,30,30); //uncomment for solid sphere
   point(30,30);
   rotateZ(z);
   point(30,30);
   //line(0,0,30,30); //uncomment for solid sphere
   translate(-width/2,-height/2,0);
   
  
 } 
  
}





