
import processing.opengl.*;
int tX = 300;
int tY = 300;
int tZ = 0;
int tStep = 1;
float rX = 0;
float rY = 0;
float rZ = 0;
float rStep = PI/180;
void setup (){
  noStroke ();
  smooth();
  size(600, 600, OPENGL);
}
void draw (){
  background(0);
  lights();
  translate(tX,tY,tZ);
  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);
  box(100);
  if(key == 'x')
  rX = rX + rStep;
  if(key == 'y')
  rY = rY + rStep;
  if(key == 'z')
  rZ = rZ + rStep;
  if(key == LEFT)
  tX = tX + tStep;
  if(key == RIGHT)
  tX = tX - tStep;
  if(key == UP)
  tY = tY + tStep;
  if(key == DOWN)
  tY = tY - tStep;
  key = ' ';
}
