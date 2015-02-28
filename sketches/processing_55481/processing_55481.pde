
class Part
{
  float x;
  float y;
  float r = 15;
  float tx;
  float ty;
  float ox;
  float oy;
  float sx;
  float sy;
  float friction;
  boolean pinned;
  public Part(float xv, float yv)
  {
    x = xv;
    y = yv;
    ox = x;
    oy = y;
  }
  void run()
  {
    y+=.5;
    verlet();
    borders();
  }
  void borders()
  {
    if(x<0) x = 0;
    //if(y<r) y = r/2;
    if(x>width) x = width;
    if(y>height)
    {
      y = height;
      friction = 0.5;
    }
    else
    {
      friction = 0;
    }
  }
  void verlet()
  {
    tx = x;
    ty = y;
    x += (x-ox)-(x-ox)*friction;
    y += (y-oy)-(y-oy)*friction;
    ox = tx;
    oy = ty;
  }
}

