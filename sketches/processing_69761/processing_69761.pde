
//loading animation, Peter Harrington, CP1 mods 16/17 
float t=0;
float m=250;
float n=230;
float x=250;
float y=230;
void setup()
{
  size(500,500);
  frameRate(70);
}
void draw()
{
  fill(20,20,20,60);
  rect(0,0,500,500);
  Infinity();
  InfinityTwo();
  InfinityThree();
  InfinityFour();
}

void Infinity()
{
  stroke(0,0,0);
  fill(0,206,0);
  ellipse(x,y,8,8);
  ellipse(m,n,8,8);
  m=m+2*sin(t);
  n=n-1*cos(t);
  x=x-2*sin(t);
  y=y+1*cos(t);
}

void InfinityTwo()
{
  stroke(0,0,0);
  fill(0,206,0);
  ellipse(x,y+10,8,8);
  ellipse(m,n+10,8,8);
  m=m+2*sin(t);
  n=n-1*cos(t);
  x=x-2*sin(t);
  y=y+1*cos(t);
}

void InfinityThree()
{
  stroke(0,0,0);
  fill(0,206,0);
  ellipse(x,y+20,8,8);
  ellipse(m,n+20,8,8);
  m=m+2*sin(t);
  n=n-1*cos(t);
  x=x-2*sin(t);
  y=y+1*cos(t);
}

void InfinityFour()
{
  stroke(0,0,0);
  fill(0,206,0);
  ellipse(x,y+30,8,8);
  ellipse(m,n+30,8,8);
  m=m+2*sin(t);
  n=n-1*cos(t);
  x=x-2*sin(t);
  y=y+1*cos(t);
  t=t+PI/30;
}
