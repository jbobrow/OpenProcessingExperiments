
float x;
float y;
float z;
int speed = 30;
void setup () 
{
  background ((color) 0, 0, 0) ;
  size (500, 500) ;
}
void draw ()
{
  x = y+0 ;
  y = x+speed ;
  z = random (255) ;
  background (0, 0, 0);
  ellipse (250, y, z, z) ;
  fill ((x), random (y), random (z)) ;
  frameRate (500) ;
  if ( y>499) {
  speed = -speed;
}
if ( y<1 ){

speed=-speed;
}}
