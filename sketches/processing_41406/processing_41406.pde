
import processing.opengl.*;


PImage t1,t2;
int r=0;
float x=0;
void setup(){
//Asuntos de pantalla
 size(400, 400, OPENGL);


t1=loadImage("t1.png");

t2=loadImage("t2.png");

}


void draw(){
  translate(-250,-250,0);
  background(0);
  pushMatrix();
  x+=0.05;
  //rotateX(sin(x));
  translate(0,0,10*sin(x));
  image(t1,0,0);
  //translate(100*sin(x)+cos(x),0,0);
  image(t1,40,0);
  
  //translate(tan(x),0,0);
  image(t1,40,0);
  
  popMatrix();
  
    pushMatrix();
  x+=0.05;
  //translate(40*sin(x),0,0);
  image(t2,20,20);
  popMatrix();
  
  
  
}

