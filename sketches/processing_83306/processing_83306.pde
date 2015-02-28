
//Em F, CP1 Mods 4-5, Pong

Ball Baozi;
Paddle Lu;
void setup()
{
  Baozi = new Ball();
  Lu = new Paddle();
  size (300, 300);
}
void draw ()
{
  background (0);
  Lu.move();
  Lu.show();
  Baozi.move();
  Baozi.bounce();
  Baozi.show();
}
class Paddle
{
  int x;
  Paddle()
  {
    x = 130;
  }
  void move()
  {
    if (mousePressed == true)
    {
      if (mouseX < Lu.x)
      {
        x--;
        if (x <= 0)
        {
          x = 0;
        }
      }
      else if (mouseX > Lu.x)
      {
        x++;
        if (x >= 251)
        {
          x = 251;
        }
      }
    }
  }
  void show ()
  {
    fill (255);
    rect (x, 290, 50, 10);
  }
}
class Ball
{
  int x, y;
  boolean up, right, gameOver;
  Ball()
  {
    x = 150;
    y = 9;
    up = false;
    right = false;
    gameOver = false;
  }
  void move()
  {
    if (right == true)
    {
      x++;
    }
    else if (right !=true)
    {
      x--;
    }
    if (up == true)
    {
      y--;
    }
    else if (up != true)
    {
      y++;
    }
  }
  void bounce ()
  {
    if (x > 291 && get(x, y) !=color(0, 0, 0))
    {
      right = false;
    }
    if (x < 9  && get(x, y) !=color(0, 0, 0))
    {
      right = true;
    }
    if (y > 270  && get(x, y) !=color(0, 0, 0))
    {
      up = true;
    }
    if (y < 9  && get(x, y) !=color(0, 0, 0))
    {
      up = false;
    }
    if (y > 291  && get(x, y) ==color(0, 0, 0))
    {
      gameOver = true;
    }
  }
  void show()
  {
    noStroke();
    fill (255);
    ellipse (x, y, 15, 15);
    if (gameOver == true)
    {
      fill (0);
      rect (0, 0, 300, 300);
      fill (255);
      textSize (30);
      text ("GAME OVER", 70, 150);
    }
  }
}
