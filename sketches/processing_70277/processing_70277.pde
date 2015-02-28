
//Alvin Ha Computer Programming 4-5 Mr Simon
//Animation Assignment

int x = 10;
int y = 5;
int xChange = 1;
void setup()
{
  
  size(400,400);
  background(x,x,x,x);
  smooth();
  x = x + 10;
}


void draw()
{
  noStroke();
  fill(50,255-x,255-x);
  rect(20,20+x,30+x,30+x);
  fill(x,255-x,x,30+x);
  ellipse(400-x,100+x,10+x,5+x);
  fill(255-x,255,x,30);
  ellipse(50+x,x,50,50);
  ellipse(x,y,10,10);
  x = x + xChange;
  y = y + 1;
  if(x < 399)
  {
    xChange = xChange + 1;
  }
  if(x >= 150)
  {
    xChange = xChange - 1;
  }
}
