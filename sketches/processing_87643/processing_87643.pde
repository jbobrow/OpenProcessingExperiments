
int x = 250;
int y = 3;
int s = 2;
void setup()
{
  background(255,0,226);
  size(500,500);
  smooth();
}
void draw()
{
  stroke(0);
  noFill();
  ellipse(x,y,s,s);
  y = y + 2;
  s = s + 2;
  if(y > 750)
  {
    background(255,0,226);
    y = 3;
    s = 2;
  }
}
