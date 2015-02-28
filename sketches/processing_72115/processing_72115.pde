
int x=250;
int y=250;
PImage ghost;
PImage children;
PImage hauntedHouse;
void setup()
{
  size(500, 500);
  background(0);
  ghost=loadImage("ghost.png");
  children=loadImage("children.gif");
  hauntedHouse=loadImage("hauntedHouse.jpg");
}
void draw()
{
background(0);
image(hauntedHouse,0,0,500,500);
  //ghost
  frameRate(10);
  tint(255, 255, 255);
  image(ghost, x, y, 100, 100);
  tint(255, 255, 255, 255);
  x=x+int(random(-10, 10));
  y=y+int(random(-10, 10));
  //keeping away from edges
  if (x<5)
  {
    x=x+int(random(0, 10));
  }
  if (y<5)
  {
    y=y+int(random(0, 10));
  }
  if (x>430)
  {
    x=x+int(random(-10, 0));
  }
  if (y>430)
  {
    y=y+int(random(-10, 0));
  }

  //children

  if (x<250)
  {
    if (y<250)
    {
      image(children, x-50, y-130);
    }
    else
    {
      image(children, x-50, y+50);
    }
  }
  else
  {
    if (y<250)
    {
      image(children, x+50, y-130);
    }
    else
    {
      image(children, x+50, y+50);
    }
  }
}


