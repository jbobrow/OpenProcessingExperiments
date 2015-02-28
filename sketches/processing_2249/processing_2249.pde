
import processing.opengl.*;

void setup()
{
  size(512,512,OPENGL);
  background(0);
  strokeCap(ROUND);
  translate(width/2,height/2);
  fill(0,140,255,30);
  noStroke();
  sphere(128);
}

void draw()
{
  stroke(255,3);
  strokeWeight(2);
  translate(width/2,height/2);
  rotateZ(PI);
  rotateX(map(mouseX,0,width,0,TWO_PI));
  rotateY(map(mouseY,0,height,0,TWO_PI));
  for(int i=0; i<60; i++)
  {
   rotateZ(TWO_PI/60);
   line(0,220,0,235);
  }
  stroke(255,0,0,20);
  strokeWeight(8);
  pushMatrix();
    rotateZ(map(second(),0,60,0,TWO_PI));
    line(0,0,0,150);
  popMatrix();
  pushMatrix();
    rotateZ(map(minute(),0,60,0,TWO_PI));
    line(0,0,0,200);
  popMatrix();
  pushMatrix();
    rotateZ(map(hour(),0,12,0,TWO_PI));
    line(0,0,0,100);
  popMatrix();
}

void mousePressed()
{
  save("screeny"+hour()+minute()+second()+".png");
}

