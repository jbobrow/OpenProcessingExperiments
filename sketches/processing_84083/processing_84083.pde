
//Samantha G. Mods 14-15 Bouncing Ball
Ball jane;
void setup ()
{
  jane = new Ball();
  size(400, 400);
}
void draw ()
{
  background(252, 176, 176);
  jane.move();
  jane.bounce();
  jane.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=200;
    y=200;
    up=false;
    right=false;
  }

    void move()
    {
      if ( right == true)
      {
        x++;
      }
      else
      {
        x--;
      }
      if (up==true)
      {
        y--;
      }
      else
      {
        y++;
      }
    }
    void bounce()
    {
      if ( x >= 400)
      {
        right = false;
      }
      if ( x <= 0)
      {
        right = true;
      }
      if (y >= 400)
      {
        up = true;
      }
      if (y <= 0)
      {
        up = false;
      }
    }
    void show ()
    {
      noStroke();
      fill(234,252,176);
      ellipse(x, y, 35, 35);
    }
  }
