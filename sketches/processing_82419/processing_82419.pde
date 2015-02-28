
//Lisa L, CP1 Mods 16/17, Bouncing Ball

Ball bob;
Ball bob2;
Ball bob3;
void setup()
{
  size(400,450);
  frameRate(240);
  bob = new Ball();
  bob2 = new Ball();
  bob3 = new Ball();
}
void draw()
{
  background(0);
  bob.move();
  bob.bounce();
  bob.show();
  bob2.move();
  bob2.bounce();
  bob2.show();
  bob3.move();
  bob3.bounce();
  bob3.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x = int(random(435));
    y = int(random(435));
    up = false;
    right = true;
  }
  void move()
  {
    if(right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if(up == true)
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
    if(x<15)
    {
      right = true;
    }
    else if(x>385)
    {
      right = false;
    }
    if(y<15)
    {
      up = false;
    }
    else if(y>435)
    {
      up = true;
    }
  }
  void show()
  {
    fill(208,115,237);
    ellipse(x,y,30,30);
  }
}
