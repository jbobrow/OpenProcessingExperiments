
PImage lena;
int x,y;
void setup()
{
  background(0);
  size(400,400);
  x=0;
  y=400;
  lena=loadImage("lena.jpg");
}
void draw()
{
  image(lena,x,y);
  if(y>=0)
  {
    y--;
  }
}

