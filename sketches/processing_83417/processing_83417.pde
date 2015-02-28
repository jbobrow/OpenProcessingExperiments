
//Eric K, CP1 mods 4-5, Bouncing Ball
//url: http://ericsprogrammingsite.webs.com/Bouncing_Ball.html

Ball ball;

void setup()
{
  size(200, 200);
  ball = new Ball();
}

void draw()
{
  background(255);
  ball.move();
  ball.bounce();
  ball.show();
}

class Ball
{
  int x, y;
  boolean right, down;
  Ball()
  {
    x = int(random(width));
    y = int(random(height));
    if (random(1) > 0.5)
    {
      right = true;
    }
    else
    {
      right = false;
    }
    if (random(1) > 0.5)
    {
      down = true;
    }
    else
    {
      down = false;
    }
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
    if (down == true)
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
    if (x < 0)
    {
      right = true;
    }
    else if (x > width)
    {
      right = false;
    }
    if (y < 0)
    {
      down = true;
    }
    else if (y > height)
    {
      down = false;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
