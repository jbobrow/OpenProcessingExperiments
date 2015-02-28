
//Aaron L. , CP1, Mods 4-5
ball chrome;
void setup()
{
  chrome = new ball();
  size(500, 500);
}
void draw()
{
  background(255);
  chrome.move();
  chrome.bounce();
  chrome.show();
}

class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(500));
    y=int(random(500));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x+=5;
    }
    else
    {
      x-=5;
    }
    if (up == true)
    {
      y-=5;
    }
    else
    {
      y+=5;
    }
  }
  void bounce()
  {
    if (x<25)
    {
      right = true;
    }
    if (x>475)
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

  void show()
  {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 50, 50);
  }
}
