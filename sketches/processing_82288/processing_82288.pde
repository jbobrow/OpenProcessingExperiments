
//Allison Wong, Bouncing Ball, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

Ball Zac;
void setup()
{
  Zac=new Ball();
  size(300,300);
}
void draw()
{
  background(0);
  Zac.move();
  Zac.bounce();
  Zac.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  
  Ball()
  {
     x = int(random(300));
    y = int(random(300));
    up = true;
    right = true;
  }
 
  void move ()
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
 
  void bounce ()
  {
    if (x == 300)
    {
      right = false;
    }
    if (x == 0)
    {
      right = true;
    }
    if (y == 300)
    {
      up = true;
    }
    if (y == 0)
    {
      up = false;
    }
  }
 
  void show ()
  {
    fill(50,227,213);
    ellipse(x, y, 40, 40);
  }
}
