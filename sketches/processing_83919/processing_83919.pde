
//Shela H. Bouncing Balls. CP 1, mods 16-17.

Ball momo;
Ball kiiro;
Ball ao;

void setup()
{
  frameRate(200);
  momo= new Ball();
  kiiro= new Ball();
  ao= new Ball();
  size(500, 500);
}
 
void draw()
{
  background(0);
  noStroke();
  fill(245,175,238);
  momo.move();
  momo.bounce();
  momo.show();
  fill(252,223,56);
  kiiro.move();
  kiiro.bounce();
  kiiro.show();
  fill(105,142,252);
  ao.move();
  ao.bounce();
  ao.show();
}
 
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(500));
    y = int(random(500));
    up=false;
    right=true;
  }
 
  void move()
  {
    if (up==false)
    {
      y++;
    }
    else
    {
      y--;
    }
 
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
 
 
    void bounce()
    {
      if(x>500)
      {
        right=false;
      }
       
      if (x<0)
      {
        right=true;
      }
       
      if(y>500)
      {
        up=true;
      }
      if (y<0)
      {
        up=false;
      }
         
    }
 
    void show()
    {
      ellipse(x, y, 50, 50);
    }
  }
