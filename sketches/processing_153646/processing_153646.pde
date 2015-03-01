
//jack lance
//Copyright
PImage flower;
float x,y,dy,dx,sz;
void setup()
{
  size(400,400);
  x=random(-width/2,width/2);
  y=random(-height/2,height/2);
  dy=random(-2,2);
  dx=random(-2,2);
  sz=random(20,50);
  flower = loadImage("download.jpg");
}
void draw()
{
  background(0);
  x+=dx;
  y+=dy;
  if (y<0)
  {
    y=height;
  }
  else if (y>height)
  {
    y=0;
  }
  if (x<0)
  {
    x=width;
  }
  else if (x>width)
  {
    x=0;
  }
  image(flower,x,y,sz,sz);
}


