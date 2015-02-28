
import processing.opengl.*;
float x,y,z,angle;


int mode = 1;
void setup(){
  size(900,900,OPENGL);
  x=random(50);
  y=0;
  angle=0;
  smooth();

}

void draw(){
  

  background(178,176,176);
  emissive(30,26,90);
  lights();
 pushMatrix();
rotateY(map(mouseX,0,width,0,PI*1));
rotateX(map(mouseY,0,height,0,PI*1));
drawShape();
popMatrix();
}


 void drawShape(){


noStroke();
fill(248,mouseY,mouseX);
  
 x = sin(radians(angle)) * 100 + width/20;
 y = cos(radians(angle)) * 100 + height/20;
 z = sin(radians(angle)) + width/20;
 pushMatrix();
 translate(x,600,y);
 rotateY(tan(z));
 rotateX(z);
 sphere(x);
 popMatrix();
 angle++;

fill(mouseX,mouseY,100);
x =cos(radians(angle)) * 100 + width/3;
y =tan(radians(angle)) * 100 + tan(height/30);
z =cos(radians(angle)) + cos(width);
pushMatrix();
translate(x,600,y);
rotateY(40*z);
rotateX(z);
sphere(y);
popMatrix();
angle++;

fill(mouseY,100,mouseX);
x =cos(radians(angle)) * 10 + width/4;
y =tan(radians(angle)) * 100 + height/4;
z =cos(radians(angle)) + width/4;
pushMatrix();
translate(x,600,y);
rotateY(tan(z));
rotateX(z);
sphere(y);
popMatrix();
angle++;

}


