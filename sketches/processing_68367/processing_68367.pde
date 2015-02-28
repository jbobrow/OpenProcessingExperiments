
int x=0;
int y=0;
int z=0;
void setup()
{
  size(900,600);
  smooth();
  frameRate(8);
}
 
void draw()
{
  background(#D10011);
  fill(255,255,0);
  if(z==0)
  {
    z=1;
    arc(80+x,100+y,150,150,QUARTER_PI,TWO_PI-QUARTER_PI);
  }
  else if(z==1)
  {
    z=2;
    arc(80+x,100+y,150,150,QUARTER_PI-0.4,TWO_PI-QUARTER_PI);
  }
  else
  {
    z=0;
    arc(80+x,100+y,150,150,0,TWO_PI);
  }
  x=x+10;
  if(x>width)
  {
  x=0;
  y=50+y;
  }
 
}

