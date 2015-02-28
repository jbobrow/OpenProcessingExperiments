
// Bouncing Ball Computer Programming 1 Lucky Lui

ball big;
void setup()
{
  big = new ball();
  size (500, 500);
}
void draw()
{
  background(0);
  big.move();
  big.bounce();
  big.show();
}

class ball
{
  int x, y, z,q;
  boolean up, right;

  ball()
  {
    x=int(random(500));
    y=int(random(500));
    z=int(random(100));
    q=int(random(100));
    up= true;
    right = true;
  }

  void move()
  {
    if (up==true)
    {
      y=y-2;

    }
    else 
    {
      y= y+2;
    }
    if (right==true)
    {
      x=x+2;
    }
    else
    {
      x=x-2;
    }
  }

  void bounce()
  {
    if ( x<0)
    {
      right = true;
      q=q-50;
      
    }
    if ( x > 500 )
    { 
      right = false;
      q=q+50;
    }
    if (y > 500)
    {
      up = true;
      z=z-50;
    }
    if (y < 0)
    {
      up = false;
      z=z+50;
    }
  }
  void show()
  {
    noStroke();
    fill(x, y, z);
    ellipse(x, y, q, z);
  }
}
