
//Sarah C CP1 16/17 Bouncing Ball

Ball fluffy;
Ball echo;
void setup()
{
  size(500,500); 
  frameRate(95);
  fluffy = new Ball();
  echo = new Ball();
  echo.x = 320;
  echo.y = 50;
}
void draw()
{
  background(0);
  fluffy.show();
  fluffy.move();
  fluffy.bounce();
  echo.show();
  echo.move();
  echo.bounce();
}

class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
   x = 80;
   y = 300;
   up = false;
   right = true;
  }
  void show()
  {
    noStroke();
    fill(255,200,200);
    ellipse(x,y,30,30);
  }
  void move()
  {
    if(up == false && right == true)
    {
    x++;
    y++;
    }
    else if (up == true && right == true)
    {
      x++;
      y--;
    }
    else if (up == true && right == false)
    {
      x--;
      y--;
    }
    else if(up == false && right == false)
    {
      x--;
      y++;
    }
  }
  void bounce()
  {
    if(y + 5 > 500)
    {
      up = true;
      right = true;
    }
    if(x + 5 > 500)
    {
      up = true;
      right = false;
    }
    if(y - 5 < 0)
    {
      up = false;
      right = false;
    }
    if(x - 5 < 0)
    {
      up = false;
      right = true;
    }
  }     
}


