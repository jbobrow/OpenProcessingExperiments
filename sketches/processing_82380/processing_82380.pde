
//Alex Lim, CP1 mods 4/5, Bouncing Ball
//www.dizbalex.webs.com
Ball Swag;
void setup()
{
  Swag = new Ball();
  size(500, 500);
}
void draw()
{
  background(0);
  frameRate (150);
  Swag.bounce();
  Swag.move();
  Swag.Ball();
}
 
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(500));
    y=int(random(500));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x+=4;
    }
    else
    {
      x-=4;
    }
    if (up == true)
    {
      y-=5;
    }
    else
    {
      y+=4;
    }
  }
 
  void bounce()
  {
    if (x<25)
    {
      right = true;
    }
    if (x>475)
    {
      right = false;
    }
    if (y<25)
    {
      up = false;
    }
    if (y>475)
    {
      up = true;
    }
  }
 
  void Ball()
  {
    noStroke();
    fill(mouseX, mouseY, 255);
    ellipse(x, y, 50, 50);
  }
}
