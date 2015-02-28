
Ball Mister;
void setup()
{
  Mister = new Ball();
  size(400, 450);
}

void draw()
{
  background(0);
  frameRate(150);
  Mister.move();
    Mister.bounce();
      Mister.show();
}

class Ball
{
  int x, y;
  boolean right, down;
  Ball()
  { 
    x = int(random(400));
    y = int(random(450));
  }
  void move()
  {
    if (right==true)
    {
      x++;
    }
    else
    {
x--;
    }
    if (down==true)
    {
      y++;
    }
    else
    {
      y--;
    }
  }
  void bounce()
  {
    if (x-15 < 0)
    {
      right = true;
    }
    if (x+15 > 400)
    {
      right = false;
    }
    if (y-15 < 0)
    {
      down = true;
    }
    if (y+15 > 450)
    {
      down = false;
    }
  }
    void show()
    {
      ellipse (x, y, 35, 35);
    }
  }
