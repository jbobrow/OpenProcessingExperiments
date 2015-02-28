
//Justin J. Bouncing Ball, CP1, Mods 16/17
Ball justin;
Ball me;
void setup()
{
  frameRate(100);
  noStroke();
  fill(255,0,0);
  justin=new Ball();
  me=new Ball();
  me.y=50;
  size(500,500);
}
void draw()
{
  background(0);
  justin.move();
  me.move();
  justin.bounce();
  me.bounce();
  justin.show();
  me.show();
}
class Ball
{
  float x,y;
  boolean up,right;
  Ball()
  {
    x=50;
    y=487.5;
    up=true;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y-=1/2.0;
    }
    else  //up==false
    {
      y+=1/2.0;
    }
    if (right==true)
    {
      x++;
    }
    else  //right==false
    {
      x--;
    }
  }
  void bounce()
  {
    if (x<12.5)
    {
      right=true;
    }
    if (x>487.5)
    {
      right=false;
    }
    if (y<12.5)
    {
      up=false;
    }
    if (y>487.5)
    {
      up=true;
    }
  }
  void show()
  {
    ellipse(x,y,25,25);
  }
}
