
//Cristen W, CP1 Mods 16/17, Bouncing Ball

Ball Doe;
Ball JDoe;
void setup()
{
  Doe = new Ball();
  JDoe = new Ball();
  size(450,500);
  frameRate(120);
}
void draw()
{
  background(0);
  Doe.Move();
  JDoe.Move();
  Doe.Bounce();
  JDoe.Bounce();
  Doe.Show();
  JDoe.Show();
  }
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x = int(random(450));
    y = int(random(500));
    up = true;
    right = true;
  }
  void Move()
  {
    if(right == true)
    {
      x+=2;
    }
    else
    {
      x-=2;
    }
    if(up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
  }
  void Bounce()
  {
    if(x<25)
    {
      right = true;
    }
    if (x>425)
    {
      right = false;
    }
    if (y<25)
    {
      up = false;
    }
    if (y>475)
    {
      up = true;
    }
  }
  void Show()
  {
    noFill();
    int h = 30;
    while(h >= 10)
    {
      stroke(47,180,167);
      ellipse(x,y,h,h);
      h -= 10;
    }
    int z = 25;
    while(z >= 5)
    {
      stroke(255);
      ellipse(x,y,z,z);
      z -= 10;
    }
  }
}
