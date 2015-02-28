
import processing.opengl.*;

float x,y,z,angle;

void setup(){
  size(800,800,OPENGL);
  angle=0;
  smooth();
  
}

void draw() {
  background(255);
  lights();
  x = cos(radians(angle))*100 + width/2;
  y = sin(radians(angle))*100 + height/2;
  z = cos(radians(angle)) + width/2;
  pushMatrix();
  translate(x,y,x);
  rotateY(x);
  rotateX(z);
 fill(random (255), random (255), random (255));
  box(50);
  popMatrix();
  angle++;
}

