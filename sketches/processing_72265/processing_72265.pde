
int x = 150;
int y = 150;
void setup()
{
  size(300,300);
  fill(110,222,181);
}
void draw()
{
  background(0);
  ellipse(x,y,50,50);
  x = x + int(random(-4,4));
  y = y + int(random(-4,4));
}
