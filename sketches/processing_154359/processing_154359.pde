
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
  
  if (x>width-20)
  {
  
    xvel=-xvel;
  }
  if (x<20)
  {
    xvel=-xvel;
  }
  if (y>height-20)
  {
    yvel=-yvel;
  }
  if (y<20)
  {
    yvel=-yvel;
  }
  ellipse(x, y, 40, 40);
}



