
int x=150;
int y=150;
PImage b;
PImage c;
void setup()
{
  size(500, 500);
  smooth();
  background(0);
  b= loadImage("buffalo.gif");
}

void draw()
{
  int r=int (random(4));
  if(mousePressed==true)
  {
     background(0);
  if(r==1)
  {
  image(b,x+15,y,200,250);
  }
  if(r==2)
  {
  image(b,x-15,y,200,250);
  }
  if(r==3)
  {
  image(b,x,y+15,200,250);
  }
  if(r==0)
  {
  image(b,x,y-15,200,250);
  }
}
}


