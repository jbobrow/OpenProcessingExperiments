
int x,y,endx,endy,startx,starty;
void setup()
{
  size(400,400);
  fill(0);
  startx=10;starty=10;
  x=0;y=starty;
  endx=endy=380;
  //ellipseMode(CORNER);
}
void draw()
{
  //background(255);
  if(y==starty && x < endx)
  {
    x+=10;
    
  }
  else if(x==endx && y<endy)
  {
    y+=10;
    
  }
  else if(y==endy && x>startx)
  {
    x-=10;
    if(x==startx)
    {
      endx-=20;
      starty+=20;
    }
    
  }  
  else if(x==startx && y>starty)
  {
    y-=10;
    if(y==starty)
    {
      endy-=20;
      startx+=20;
    }
    
  }
  
  rect(x,y,10,10);
}

