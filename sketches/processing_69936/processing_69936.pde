
//Justin J, CP1 Mods 16/17, Basic Animation
int x=0;
int c=255;
void setup()
{
  background(0);
  noFill();
  stroke(255, 0, 0);
  size(500, 500);
}
void draw()
{
  circle();
}
void circle()
{
  ellipse(250, 250, x, x);
  x=x+5;
  if (x==700)
  {
    background(0);
    stroke(0, c, 0);
    x=x-699;
  }
  if (x>710)
  {
    background(0);
    stroke(0, 0, c);
    x=x-714;
  }
  if (x==702)
  {
    background(0);
    stroke(c, 0, 0);
    x=x-702;
  }
}
