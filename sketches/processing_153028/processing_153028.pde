
int xspeed= 5;
int x=50;
int y=50;
int yspeed= 5;




void setup()
{
  size (700, 700);
}
void draw()
{
  background (random(0, 255), 300, 300);


  if (keyPressed)
  {
    if (keyCode==UP)
    {
      y=y- 20;
    }
    if (keyCode==DOWN)
    {
      x=x- 20;
    }
    if (keyCode==LEFT)
    {
      y=y-20;
    }
    if (keyCode==RIGHT)
    {
      x=x-20;
    }
  }

  fill(random(0, 400), random(0, 700), 0);
  ellipse(x, y, 50, 50);
  fill(40, 40, 40);

  x=x+xspeed;
  y=y+yspeed;
  if (x > width-25)
  {
    xspeed = -5;
  }
  if (y> width-25)
  {
    yspeed = -3;
  }
  if (y<0)
  {
    yspeed = 7;
  }
  if (x<0)
  {
    xspeed= 7;
  }
  // if(rect(mouseX, mouseY, 30, 30)>width-25);
}

