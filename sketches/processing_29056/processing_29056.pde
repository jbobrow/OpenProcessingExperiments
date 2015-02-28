
import netscape.javascript.*;
 
float rotX = 5*PI/4-0.16,  rotY = PI/4,  rotz = PI/2;
float incX= .5, incY= .5;



void setup() {
  frameRate(10);
  size(640, 480, P3D);
  lights();
  smooth();
}
 
void draw() {
  background(0);
   
  pushMatrix();
 
  translate(width/2, height/2, 0);
  rotateY(rotX);
  rotateX(rotY);
  rotX += incX;  
  rotY += incY;

  stroke(0,0,0);
  fill(100,100,100);
  box(20);
      
  popMatrix();
 
  fill(0,0,255);
  int rotXDeg = (int)(rotX * 180/PI + .5);
  int rotYDeg = (int)(rotY * 180/PI + .5);
 
 
}



