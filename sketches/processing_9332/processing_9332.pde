
import processing.opengl.*;

PImage img;

void setup()
{
  img = loadImage("a.jpg");

  //size(img.width,img.height,OPENGL);
  size(img.width,img.height,P3D);
  //size(800,800,OPENGL);
  background(0);
  
  
}

void draw()
{
  rectMode(CENTER);
  ellipseMode(CENTER);
  float x = random(0,img.width);
  float y = random(0,img.height);
  color col = img.get(int(x),int(y));
  float siz = random(5,15);
  float rd = red(col);
  float grn = green(col);
  float bl = blue(col);
  rd = random(rd/2,2*rd/3);
  grn = random(grn/8,grn/4);
  bl = random(bl/8,bl/4);

  fill(rd,grn,bl);
  noStroke();

  if(brightness(col)>120)
  ellipse(x,y,siz,siz);
}

