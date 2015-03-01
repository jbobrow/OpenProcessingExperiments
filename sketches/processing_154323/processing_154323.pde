
//Nancy Wang nancyw
//copyright notice
float wd = 100, ht = 100;
float x=0, y=0;
float deltaX = 3;
float deltaY = 3;
PImage pic;

void setup()
{
  size(400, 400);
  smooth();
  pic = loadImage("snowflake.jpg");
}

void draw()
{
  background(0);
  
  image (pic, x, y, wd, ht);
  
  // bouncing for x
  x = x+deltaX;
  if (x+wd> width  ||  x<0)
 {
   deltaX = -deltaX;
 }
 
 // bouncing for y
 y = y+deltaY;
  if (y+ht> height  ||  y<0)
 {
   deltaY = -deltaY;
 }
}


