
PImage lena;
int x,y;
void setup()
{
  background(0);
  size(400,400);
  x=-400;
  y=0;
  lena=loadImage("lena.jpg");
}
void draw()
{
  image(lena,x,y);
  if(x<=0)
  {
    x++;
  }
}

