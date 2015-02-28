
int x=250;
int y=250;
int z=250;
float r=random(1, 256);
float g=random(1, 256);
float b=random(1, 256);
int direction= int(random(1,7));
void setup()
{
  size(500,500,P3D);
  background(0);
}
void draw()
{
  translate(x,y,z);
  direction = int(random(1,7));
  if (direction==1)
  {
    if(x<490)
    {
    x=x+8;//right
    }
  }
  if (direction==2)
  {
    if(x>10)
    {
    x=x-8;//left
    }
  }
  if (direction==3)
  {
    if(y>10)
    {
    y=y-8;//up
    }
  }
  if(direction==4)
  {
    if(y<490)
    {
    y=y+8;//down
    }
  }
  if(direction==5)
  {
    if(z>-200)
    {
    z=z-8;//away
    }
  }
  if(direction==6)
  {
    if(z<200)
    {
    z=z+8;//towards
    }
  }
  if (r>255)
  {
    r=int(random(1, 256));
  }
  if (g>255)
  {
    g=int(random(1, 256));
  }
  if (b>255)
  {
    b=int(random(1, 256));
  }
  r=r+1.25;
  g=g+1.25;
  b=b+1.25;
  fill(r,g,b,100);
  box(8);
}
    
    
    
  

