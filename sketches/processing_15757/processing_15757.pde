
class Objects
{
  float n,m,s;
  color c;
  boolean hit;

  void show()
  {
    fill(c);
    ellipse(n,m,20,20);
  }

  void move()
  {
    m += 2*s;
  }

  void bottom()
  {
    if (m > height)
    {
      n = random(0,width);
      m = 0;
    }
  }
}

