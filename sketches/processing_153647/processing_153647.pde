
//jack lance
//Copyright
PImage flower;
float x,y,dy,dx,sz;
void setup()
{
  size(400,400);
  x=width/2;
  y=height/2;
  dy=random(-4,4);
  dx=random(-4,4);
  sz=random(20,50);
  flower = loadImage("download.jpg");
}
void draw()
{
  background(0);
  x+=dx;
  y+=dy;
  if (y<0 || y>height-sz)
  {
    dy*=-1;
  }
  if (x<0 || x>width-sz)
  {
    dx*=-1;
  }
  image(flower,x,y,sz,sz);
}


