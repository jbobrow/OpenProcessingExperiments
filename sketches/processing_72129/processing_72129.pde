
//Hanson T. Ticklish Ghost, Cp1 16/17
int x =0;
int y=0;
PImage b;
void setup()
{
  size(300,300);
  b = loadImage("casper2.jpg");
}
void draw()
{
   background(0);
   image(b,x,y,300,300);
   x=x+int(random(-10,10));
   y=y+int(random(-10,10));
}
/**
Watch Casper the ghost haunts you from different positions of the screen, even when off the screen. 
*/

