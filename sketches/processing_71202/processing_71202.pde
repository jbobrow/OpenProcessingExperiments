
int sideLength=20;
int x,y;
void setup() 
{
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(0);
}
 
void draw()
{
  if (frameCount<2)
  {
    for( y=0;y<500;y+=sideLength)
    {
      for(x=0;x<500;x+=sideLength)
      {
        int r=int(random(1,6));
        if(r==1)
        {
          triangle(x, y, x+sideLength, y, x,  y+sideLength);
        }
        if(r==2)
        {
         triangle(x,y,x+sideLength,y, x+sideLength,y+sideLength);
        }
        if(r==3)
        {
          triangle(x,y,x+sideLength,y+sideLength,x,y+sideLength);
        }
        if(r==4)
        {
          triangle(x+sideLength,y,x+sideLength,y+sideLength,x,y+sideLength);
        }
        if(r==5)
        {
          rect(x,y,sideLength,sideLength);
        }
      }
    }
  }
}
