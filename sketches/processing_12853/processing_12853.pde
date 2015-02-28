
//import processing.opengl.*;

float inc = 0;
PFont font;

void setup() 
{
  size(600,600,P2D);
  colorMode(HSB,100);
  frameRate(60);
}

void draw() 
{
  background(0);
  
  noiseDetail(2,.5);
  
  for (int x = 0 ; x<=width ; x+=8)
  {
    for (int y = 1 ; y<=height ; y+=8)
    {
      float noise = noise(x*0.01 + inc , (2*height*2*height/y)*0.008 - inc , inc);
      float angle =  noise * TWO_PI;
      float xx = x + 12 * cos(angle);
      float yy = y + 12 * sin(angle);
      stroke(20 + noise*80);
      line(x,y,xx,yy);
    }
  }
 
  inc+=.02;
}

void keyPressed() 
{
  // Catches the ESCAPE key
  if (key == ESC) 
  {
    exit();
  }
}

void mousePressed() 
{
}


