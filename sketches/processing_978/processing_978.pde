
import processing.opengl.*;

void setup() {
  size(400,400,OPENGL);
}

void draw() {
  lights();
  fill(255);
  background(0);
  translate(width/2,height/2);
  float r = map(mouseX,0,width,0,TWO_PI);
  rotateX(r);
  rotateY(r);
  box(999);
  translate(-50,50,-50);
  sphere(50);
  
}

