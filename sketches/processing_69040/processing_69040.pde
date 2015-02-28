
//Alex Lim, CP1 mods 4/5, Loops
//http://dizbalex.webs.com

size (500, 500);
{
  background (0, 0, 0);
  smooth ();
}
int x=0;
int w=0;
int y=0;
while (x<501)
{
  fill(random(255), 0, 50, 50);
  stroke (150, 0, 0);
  ellipse (x, 250, 250, w);
  ellipse (500-x, 250, 250, w);
  ellipse (250, 0+x, 250, w);
   x = x+4;
   w = w+2;
}
{
  stroke (255, 255, 255);
  ellipse (0, x, 250, w); 
  ellipse (500, x, 250, w);
  ellipse (0, 500-x, 250, w);
  ellipse (500, 500-x, 250, w);
  x = x+4;
  w = w+2;
}
