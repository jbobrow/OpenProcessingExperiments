
//Grace O. Bouncing Ball Mods 14-15 C.P.1
ball steph;
boolean gameOver;
void setup()
{
  size(300, 400);
  steph = new ball();
}
void draw()
{
  background(0);
  steph.move();
  steph.bounce();
  steph.show();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x= 150;
    y = 150;
    if (random(1)<.5)
    {
      up = true;
    }
    else
    {
      up=false;
    }
    if (random(1)<.5)
    {
      right = false;
    }
    else
    {
      right = true;
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
    if (up == true)
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
    if (x<5)
    {
      right=true;
    }
    if (x>295)
    {
      right=false;
    }
    if (y>395)
    {
      up=true;
    }
    if (y<5)
    {
      up=false;
    }
  }
  void show()
  {
 
      fill(255);
      ellipse(x, y, 20, 20);
  
  }
}
