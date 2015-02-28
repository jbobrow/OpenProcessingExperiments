
//import processing.opengl.*;
int r=100;
color col=255;
float theta=0.1,t=0.1;
void setup()
{
  size(900,450,P3D);
  background(0);
  fill(random(255),random(255),random(255),70);
  stroke(255,100,30);
  //noStroke();
}
void draw()
{
  if(mousePressed&&mouseButton==LEFT)
    fill(random(255),random(255),random(255),170);
  if(mousePressed&&mouseButton==RIGHT)
    stroke(random(255),random(255),random(255),170);
  background(0);
  translate(width/2,height/2,-1000);
  rotateX(t);
  for(float x=0;x<2*PI;x+=PI/int(map(mouseX,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x);
    pushMatrix();
    translate(500,0,0);
    box(map(mouseY,0,height,1,100));
    popMatrix();
  }
  rotateY(PI);
    for(float x=0;x<2*PI;x+=PI/int(map(mouseX,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x);
    pushMatrix();
    translate(500,0,0);
    box(map(mouseY,0,height,1,100));
    popMatrix();
  }
  theta+=0.01;
  t+=0.01;
}

