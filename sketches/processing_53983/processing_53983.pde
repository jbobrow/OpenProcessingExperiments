
import processing.opengl.*;
float ang = 0.0;

void setup(){
  size(400,400,OPENGL);
}

void draw()
{
  background(150,180,250);
  noStroke();
  fill(240,200,120);
  rect(0,150,width,height);
  translate(width/2,height/2);
  rotateY(ang);
  ang+=0.01;
  scale(2);
  drawPyramid(0,0,0);
  drawPyramid(0,0,50);
  drawPyramid(0,0,-50);
}


void drawPyramid(float x,float y, float z){
  smooth();
 fill(210,170,120);
  beginShape(TRIANGLE_FAN);
  vertex(x,y,z);
  vertex(x+10,y+20,z-10);
  vertex(x+10,y+20,z+10);
   vertex(x-10,y+20,z+10);
    vertex(x-10,y+20,z-10);
    endShape();
}

