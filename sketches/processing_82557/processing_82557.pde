
//Winston L, Bounce!, CP1, Mods 4-5
//http://www.openprocessing.org/sketch/82557

bouncingBall billy = new bouncingBall();
void setup()
{
  size(500, 500);
}
void draw()
{
  background(255);
  billy.move();
  billy.bounce();
  billy.show();
}
class bouncingBall
{
  int x, y;
  boolean up, right;
  bouncingBall()
  {
    x=int(random(200, 400));
    y=100;
    up=true;
    right=true;
  }
  void move()
  {
    if(up==true)
    {
      y--;
    }
    if (up==false)
    {
      y++;
    }
    if(right==true)
    {
      x++;
    }
    if(right==false)
    {
      x--;
    }
  }
  void bounce()
  {
    if(x<15)
    {
      right=true;
    }
    if(x>485)
    {
      right=false;
    }
    if(y<15)
    {
      up=false;
    }
    if(y>485)
    {
      up=true;
    }
  }
  void show()
  {
    fill(random(256),random(256),random(256),random(125,255));
    stroke(random(256),random(256),random(256),random(125,255));
    ellipse(x, y, 30, 30);
  }
}
