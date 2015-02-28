
// copyright Mark Obeldobel July 2013

float mx, my, jx, jy, ox, oy, djy, djx;
void setup( )
{
size(500, 500);
background (200, 210, 23);
jx = 210;
jy = 200;
mx = 30;
my = 100;
ox = 410;
oy = 125;
djx = 1;
djy = 1;
}
void draw( )
{
background (200, 210, 23);
fill(230, 40, 50);
triangle(mx, my, mx + 40, my - 50, mx + 80, my);
triangle(mx + 80, my, mx + 120, my - 50, mx + 160, my);
fill(35, 240, 35);
rect(mx, my, 40, 100);
rect(mx + 160, my, -40, 100);
//J
fill(92, 52, 214);
rect(jx, jy, 30, -50);
rect(jx + 30, jy, 40, -15);
triangle(jx + 60, jy, jx + 110, jy, jx + 80, jy - 150);
//O
fill(111, 234, 223);
ellipse(ox, oy, 140, 170);
fill(200, 210, 23);
ellipse(ox, oy, 70, 85);
fill(200, 210, 23);
//moving
mx ++;
my --;
jx = jx +djx;
jy = jy + djy;
ox --;
oy --;
//Jmoving
  if( jx >= width || jx <= 0) djx = -djx;
  if( jy >= height || jy <= 0) djy = -djy;
//Mmoving 
  if( mx <= 0) mx += width;
  if( my <= 0) my += height;
  if( mx >= width) mx -= width;
  if( my >= height) my -= height;
//Omoving
  if( ox <= 0) ox += width;
  if( oy <= 0) oy += height;
  if( ox >= width) ox -= width;
  if( oy >= height) oy -= height;
}


