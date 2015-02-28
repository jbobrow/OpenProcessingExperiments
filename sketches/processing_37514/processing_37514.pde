
//Cristina Mele
// cmele@andrew.cmu.edu
// Copyright © Cristina Mele
// September 2011 
// Pittsburgh Pa, 15221 
// All Rights Reserved


color randomCol;
int x,y;


void setup()
{
  size (400,400);
  background (60,63,69);
  smooth();
  
  x=0;
  y=0;

}

void draw()
{
  
 
  noStroke();
  while(x<=width+50 && y<=height+50)
  {
   color randomCol = color(random(256), random(255), random(256), 75);
   fill(randomCol);
   ellipse (x, y, random (10, 20), random (10, 20));
   x = x+5;
   if (x == width)
    {
      x = 0;
      y = y+40;
    }
  }
  
 
 
 
}


