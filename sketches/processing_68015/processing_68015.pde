
int x=0;
int y=0;
int z=0;
float rot=0;
int velocidad=25;

void setup()
{
  size(800,500);
  smooth();
  frameRate(8);
}

void draw()
{
  background(#213454);
  fill(255,255,0);
  if(z==0)
  {
    z=1;
    arc(200+x,200+y,100,100,QUARTER_PI+rot,TWO_PI-QUARTER_PI+rot);
  }
  else if(z==1)
  {
    z=2;
    arc(200+x,200+y,100,100,QUARTER_PI-0.4+rot,TWO_PI-QUARTER_PI+0.4+rot);
  }
  else
  {
    z=0;
    arc(200+x,200+y,100,100,0+rot,TWO_PI+rot);
  }
  if(200+x>width)
  {
    x=-200;
  }
  if(200+x<0)
  {
    x=width-200;
  }
  if(200+y<0)
  {
    y=height-200;
  }
  if(200+y>height)
  {
    y=-200;
  }
  //fill(0);
  //arc(185+x,185+y,10,25,0+rot,TWO_PI-HALF_PI+rot);
}

void keyPressed()
{
  if(keyCode==RIGHT)
  {
    x=x+velocidad;
    rot=0;
  }
  if(keyCode==LEFT)
  {
    x=x-velocidad;
    rot=PI;
  }
  if(keyCode==UP)
  {
    y=y-velocidad;
    rot=-HALF_PI;
  }
  if(keyCode==DOWN)
  {
    y=y+velocidad;
    rot=HALF_PI;
  }
}


