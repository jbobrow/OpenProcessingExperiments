
//homework 3
//emily wobb, ewobb, copyright wobb, Pittsburgh

float x, y, wd, ht;

void setup( )
{
  size (400, 400);
  x = 300;
  y = 0;
  wd = 69;
  ht = 69;
 
}

void draw()
{
  background(82,46,183);
  fill(194,236,237);
  rect(x, frameCount%width, wd, ht);
   y = y *3;
  fill (252,228,196);
  triangle(x,frameCount%height, wd -60, ht - 60, wd + 14, ht + 55);
  
  y = y * 2;
  fill(19,184,188);
  triangle(x, frameCount%width, wd + 50, ht +40, wd + 30, ht+ 20);
 
 fill(224,25, 247);
 triangle(x, frameCount% height, wd + 22, ht + 35, wd + 23, ht + 11);
 
 fill(193, 245, 84);
 triangle(x, frameCount% height, wd + 20, ht + 30, wd + 20, ht + 8);
}




