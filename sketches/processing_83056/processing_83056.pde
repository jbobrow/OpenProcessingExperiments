
//Eugene Liang, Bouncing Ball, CP1, Mods 16-17

Ball Tuan;
TinyBall Pham;
BigBall Truong;
void setup()
{
  frameRate(1000);
  size (600,500);
  Tuan = new Ball();
  Pham = new TinyBall();
  Truong = new BigBall();
}

void draw()
{
  background (0);
  Tuan.show();
  Tuan.move();
  Tuan.bounce();
  Pham.show();
  Pham.bounce();
  Pham.move();
  Truong.show();
  Truong.move();
  Truong.bounce();
}

class Ball
{
  float x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(500));
    y = int(random(500));
    up = false;
    right = false;
  }
  void move()
  {
    if (right == true)
    {
      x = x + 1;
    }
    if (right == false)
    {
      x = x - 1;
    }
    if (up == true)
    {
      y = y + 1;
    }
    if (up == false)
    {
      y = y - 1;
    }
  }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
    }
    if ( x > 600)
    {
      right = false;
    }
    if (y < 0)
    {
      up = true;
    }
    if (y > 500)
    {
      up = false;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x,y,25,25);
  }
}

class TinyBall
{
  float x, y;
  boolean up, right;
  TinyBall()
  {
    x = int(random(600));
    y = int(random(500));
    up = false;
    right = false;
  }
  void move()
  {
    if (right == true)
    {
      x = x + 1;
    }
    if (right == false)
    {
      x = x - 1;
    }
    if (up == true)
    {
      y = y + 1;
    }
    if (up == false)
    {
      y = y - 1;
    }
  }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
    }
    if ( x > 600)
    {
      right = false;
    }
    if (y < 0)
    {
      up = true;
    }
    if (y > 500)
    {
      up = false;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x,y,10,10);
  }
}
class BigBall
{
  float x, y;
  boolean up, right;
  BigBall()
  {
    x = int(random(600));
    y = int(random(500));
    up = false;
    right = false;
  }
  void move()
  {
    if (right == true)
    {
      x = x + 1;
    }
    if (right == false)
    {
      x = x - 1;
    }
    if (up == true)
    {
      y = y + 1;
    }
    if (up == false)
    {
      y = y - 1;
    }
  }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
    }
    if ( x > 600)
    {
      right = false;
    }
    if (y < 0)
    {
      up = true;
    }
    if (y > 500)
    {
      up = false;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x,y,50,50);
  }
}
