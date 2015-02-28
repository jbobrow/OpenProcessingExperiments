
// Alina V, CP1 mods 16,17, Bouncing Ball
Ball one;
Ball two;
Ball three;
Ball four;
void setup()
{
  size(400, 400);
  frameRate(100);
  one = new Ball();
  two =  new Ball();
  three = new Ball();
  four = new Ball();
}
void draw()
{
  background(0);
  one.move();
  one.bounce();
  one.show();
  one.changeColor();
  two.move();
  two.bounce();
  two.show();
  two.changeColor();
  three.move();
  three.bounce();
  three.show();
  three.changeColor();
  four.move();
  four.bounce();
  four.show();
  four.changeColor();
}
class Ball
{
  int x, y, r, g, b;
  boolean up, right;
  Ball()
  {
    x = int(random(400));
    y = int(random(400));
    up = true;
    right = false;
    r = (int(random(255)));
    b = (int(random(255)));
    g = (int(random(255)));
  }
  void move()
  {
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if (x <= 0)
    {
      right = true;
    }
    if (x >= 400)
    {
      right = false;
    }
    if (y <= 0)
    {
      up = false;
    }
    if (y >= 400)
    {
      up = true;
    }
  }
  void show()
  {
    fill(r, g, b);
    ellipse(x, y, 40, 40);
  }
  void changeColor()
  {
      r = (int(random(255)));
      b = (int(random(255)));
      g = (int(random(255)));
  }
}
