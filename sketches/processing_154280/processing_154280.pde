
int x, y, xvel, yvel;
void setup()
{
  x=200;
  y=200;
  xvel=5;
  yvel=3;
  size(400,400);
  smooth();
  background(0);
  
  

}
void draw()
{
  x=x+xvel;
  y=y+yvel;
  
  if (x>width+20)
  {
  
    x=-20;
  }
  if (x<-20)
  {
    x=height+20;
  }
  if (y>height+20)
  {
    y=0;
  }
  if (y<-20)
  {
    y=height+20;
  }
  ellipse(x, y, 40, 40);
}



