
//homework 5, version 3
//copyright Jessica Schafer, Sept. 2011, pittsburgh, pa

int x = 0;
int y = 0;
color clr = color(150, 0,0);

void setup ()
{
 size (400, 400);
 background (255);
}

void draw ()
{
 
 if (keyPressed)
   {
     fill (0, 2); 
     rect (0,0, width, height); 
    }
    
  while (x<=width && y<=height)
 {
  fill (clr);
  rect (x, y, 10, random (5, 20));
  x = x+10; 
  clr = color(random (50, 255), 0, 0);
  if (x == width)
    {
      x = 0;
      y = y+15;
    }
  fill (255);
  rect (170, 380, width, height);
  fill(clr);
  text ("Press any key to turn off the lights", 175, 395);
  } 



} 
 
             
