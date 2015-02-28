
//Jonathan Huang 16/17 CP1

int x = 250;
int y = 250;
PImage boo;
void setup()
{
  size(500, 500);
  boo = loadImage("http://www.mariowiki.com/images/c/c9/MP7Boo.png");
}
void draw()
{
  rect(0, 0, 500, 500);
  if (mousePressed==false)
  {
    image(boo, x, y, 100, 100);
    x = x + int(random(-50, 50));
    y = y + int(random(-50, 50));
  }
  if (x > 500)
  {
    x= 250;
  }
  if (x <0)
  {
    x = 250;
  }
  if (y> 500)
  {
    y = 250;
  }
  if (y< 0)
  {
    y= 250;
  }
}
