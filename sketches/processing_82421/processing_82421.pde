
Ball why1; 
Ball noob;
Ball why;
Ball a;
Ball b;
Ball c;
Ball d;
Ball e;
Ball f;
Ball g;
void setup()
{
  why1 = new Ball();
  noob = new Ball();
  why = new Ball();
  a = new Ball();
  b = new Ball();
  c = new Ball();
  d = new Ball();
  e = new Ball();
  f = new Ball();
  g = new Ball();
  size(300, 300);
  background(0, 0, 0);
}
void draw()
{
  why1.move();
  why1.bounce();
  why1.show();
  noob.move();
  noob.bounce();
  noob.show(); 
  why.move();
  why.bounce();
  why.show();
  a.move();
  a.bounce();
  a.show();
  b.move();
  b.bounce();
  b.show();
  c.move();
  c.bounce();
  c.show();
  d.move();
  d.bounce();
  d.show();
  e.move();
  e.bounce();
  e.show();
  f.move();
  f.bounce();
  f.show();
  g.move();
  g.bounce();
  g.show();
}
class Ball
{
  int x, y, z;
  boolean up, right;
  Ball()
  {
    x = int(random(0, 300));
    y = int(random(0, 250));
    z = int(random(0, 275));
    up = true;
    right = true;
  }
  void move()
  {
    if (up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
    if (right == true)
    {
      x+=2;
    }
    else
    {
      x-=2;
    }
  }
  void bounce()
  {
    if (x < 10)
    {
      right = true;
    }
    if (x > 265)
    {
      right = false;
    }
    if (y < 10)
    {
      up = false;
    }
    if (y > 265)
    {
      up = true;
    }
  }
  void show()
  {
    fill(x, y, z);
    ellipse(x, y, 25, 25);
  }
}
