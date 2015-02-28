
//Grace O mods 14-15 CP1 Moving Shapes
int x;
int changeX=1;
int y;
int changeY=1;
void setup()
{
  size(300, 200);
}
void draw()
{
  background(250-2*x, 250-2*x, 250-2*x);
  strokeWeight(x/5);
  stroke(x*2.5);
  noFill();
  ellipse(150, 100, x, y);
  x = x + changeX;
  y = y + changeY;
  print("x");
  print(x);
  print("y");
  print(y);
  if (x>100)
  {
    changeX =-2;
    changeY =-2;
  }
  if (x<1)
  {
    changeX=1;
    changeY=1;
  }
}
