
int x, y, v ;
void setup()
{
  size(500,400);
  strokeJoin(BEVEL);
  background(0,80,150);
}
void draw()
{
  fill(300, 200);
  rect(0, 0, width, height);
  x++;
  y+=v;
  if (y>=height)
  {
    y = height;
    v *= -0.956;
  }
  else
  {
    v++;
  }
  fill(120, 100, 155,600);
  rect(x, y, 50, 50);
  smooth();
  strokeWeight(3);
  
    if(x>width) 
  {
    x=y=v=0;
  }
}

