
//Michael H  C.P 1  Mods 16-17
// Bouncing Ball


ball joe;
void setup()
{
  joe = new ball();
  size (300,300);
}
void draw()
{
  background(0);
  joe.move();
  joe.bounce();
  joe.show();
}

class ball
{
  int x,y;
  boolean up,right;
  ball()
  {
    x= int(random(300));
    y= int(random(300));
    up=false;
    right= false;
  }


void move()
{
  if (right==true)
  {
    x+=20;
  }
  else
  {
    x-=20;
  }
  if (up==true)
  {
    y-=20;
  }
  else
  {
    y+=20;
  }
}
void bounce()
{
  if (x<0)
  {
    right=true;
  }
  if (x>300)
  {
    right=false;
  }
  if (y<0)
  {
    up=false;
  }
  if (y>300)
  {
    up=true;
  }
}
void show()
{
  fill(0,255,0);
  ellipse(x,y,30,30);
}
}
