
//Jun Min Z, Mods 16-17, CP1, Bouncing Ball

Ball justin;
Ball jarvis;
Ball wayland;
void setup()
{
  justin=new Ball();
  jarvis=new Ball();
  wayland=new Ball();
  size(1000, 1000);
  frameRate(60);
}

void draw()
{
  justin.move();
  justin.bounce();
  justin.show();
  jarvis.move();
  jarvis.bounce();
  jarvis.show();
  wayland.move();
  wayland.bounce();
  wayland.show();
}

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(1000));
    y=int(random(1000));
    up=true;
    right=true;
  }

  void move()
  {
    if (up==true)
    {
      y=y+5;
    }
    if (up==false)
    {
      y=y-4;
    }
    if (right==true)
    {
      x=x+5;
    }
    if (right==false)
    {
      x=x-4;
    }
  }

  void bounce()
  {
    if (x>950)
    {
      right=false;
    }
    if (x<50)
    {
      right=true;
    }
    if (y>950)
    {
      up=false;
    }
    if (y<50)
    {
      up=true;
    }
  }
  void show()
  {
    stroke(0,0,0,50);
    noFill();
    ellipse(x, y, 100, 100);
  }
}
