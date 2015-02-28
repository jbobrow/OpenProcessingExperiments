
//Ashley Wong amwong
//Copyright Pittsburgh 2012

float a,x,y,d;
color col;

void setup()
{
  size(600,400);
  x=100;
  y=100;
  d=50;
  a=random(50);
  background(150,25);
}

void draw()
{
  col= color(random(240),random(60),random(200));
  flower();
}

void topPetal(float o, float h, float k, float m)
{
  noStroke();
  fill(col,o);
  quad(h,k+m, h+m/2,k, h,k-m, h-m/2,k);
}
void sidePetal(float o, float h, float k, float m)
{
  noStroke();
  fill(col,o);
  quad(h,k+m/2, h+m,k, h,k-m/2, h-m,k);
}

void flower()
{
  x=pmouseX+random(-25,25);
  y=pmouseY+random(-25,25);
  topPetal(a,x,y,d);
  sidePetal(a,x,y,d);
  d= d+1;
  if (d>40)
  {d=-d;
  }
}
