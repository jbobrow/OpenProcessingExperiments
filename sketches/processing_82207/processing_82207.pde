
//Brian C, Bouncing Ball, CP1 Mods 16/17

ball bob;
void setup()
{
  bob = new ball();
  size(300,300);
  frameRate(75);
}
void draw()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
}
class ball
{
  float x, y;
  boolean up, right;
  ball()
  {
    x = 10;
    y = 10;
    up = false;
    right = true;
  }
  void move()
  {
    if (right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if (up == true)
    {
      y--;
    }
    else
    {
      y = y + 2;
    }
  }
  void bounce()
  {
    if (x <=10)
    {
      right = true;
      background(226,71,234);
    }
    if (x >= 290)
    {
      right = false;
      background(70,36,211);
    }
    if (y >= 290)
    {
      up = true;
      background(80,184,247);
    }
    if (y <= 10)
    {
      up = false;
      background(49,134,78);
    }
  }
  void show()
  {
    noStroke();
    fill(242,149,7);
    ellipse(x,y,20,20);
  }
}
