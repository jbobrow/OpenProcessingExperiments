
//Jarvis Law,Animation,Cp1 Mod 19-20
int a=3;
int b=40;
int x= 10;
int y=80;
int z=0;
void setup()
{
  size(500,500);
  stroke(255,255,255);
  noFill();
  background(21,76,234);
  
}
void draw()
{
  fill(0,0,0,20);
  stroke(6,128,160,20);
  ellipse(250,250,x,x);
  x=x+a;
  fill(244,233,0,15);
  stroke(255,158,0);
  ellipse(250,250,y,y);
  if (x>490)
  {
    background(21,76,234);
    x=-x;
  }
  if (x>469)
  {
    y=y+5;
  }
  if (y>429)
  {
    background(211,64,11);
    y=y-30;
    stroke(232,121,16);
    ellipse(250,250,b,b);
    b=b+10;
  }
  if (b<99)
  {
    stroke(232,16,178,255);
  }
}
