
// Copyright 2014 Jacklynn Pham
// ICE #11

float x, y, wd, ht;
float pos;
float pos2;

void setup()
{
  size(800,400);
  
  x = 0;
  y = 0;
  wd = 30;
  ht = 30;
  
}

void draw() 
{
  pageSetup();
  drawRect();
  drawCircles();
}

void drawCircles()
{
 fill (0, 0, 255);
 
  pos = 0;
  
  while (pos < width/2)
    {
      ellipse( pos+width/2, pos, wd, wd);
      ellipse( width-pos, pos, wd, wd);
      pos += wd;
      
    }
}

void drawRect()
{
 fill ( 255, 0, 0);
   pos = 0;
    while (pos < width/2) // left right
  {
      rect( pos, y, wd, wd); // top
      rect( pos, height-wd, wd, wd); // bottom
      pos += wd;
  }
   pos = 0;
   while (pos < width) // left right
    {
      rect( x, pos, wd, wd); // left
      rect( width/2, pos, wd, wd); //right
      pos += wd;
    }
}

void pageSetup()
{
  fill(0); 
  rect( 0, 0, width/2, height);
  fill(255);
  rect(width/2, 0, width/2, height);
}


