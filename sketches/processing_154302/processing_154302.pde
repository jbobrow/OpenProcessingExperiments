
//Nancy Wang nancyw
//copyright notice
float wd, ht;
float x=0, y=0;
float easing;
float deltaX;
PImage pic;

void setup()
{
  size(400, 400);
  smooth();
  easing=.05;
  pic = loadImage("snowflake.jpg");
}

void draw()
{
  background(0);
  
  image (pic, x, y, 100, 100);
  x = x+3;
  if (x > 400)
 {
   x=-50;
 } 
 y = y+3;
  if (y > 400)
 {
   y=-50;
 } 
}


