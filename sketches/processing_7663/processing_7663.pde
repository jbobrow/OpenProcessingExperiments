
// Project: DownTheStairs
// File: Ball
// Author: James Justinic
// Date: 2/8/2010

class Ball
{
  PVector location;
  float xs, ys, g;
  float f, d;
  float r;
  Stairs s;

  Ball(float x, float y, float xs, float ys, float g, float f, float d, float r, Stairs s)
  {
    this.location = new PVector(x, y);
    this.xs = xs;
    this.ys = ys;
    this.g = g;
    this.f = f;
    this.d = d;
    this.r = r;
    this.s = s;
  }

  void drawBall()
  {
    location.x += xs;
    ys += g;
    location.y += ys;

    if (location.x > width-r)
    {
      xs *= -1;
    }

    if (location.y > s.floorHeightAt(location.x)-r)
    {
      location.y = s.floorHeightAt(location.x)-r;
      ys *= -1;
      ys *= d;
      xs *= f;
    }

    if (location.x < s.wallLocationAt(location.y)+r)
    {
      location.x = s.wallLocationAt(location.y)+r;
      xs *= -1; 
    }

    stroke(1);
    fill(200, 0, 0);

    if (location.y == s.floorHeightAt(location.x)-r && abs(xs) > 0.5 && abs(ys) > 0.5)
    {
      ellipse(location.x, location.y+(r/4), r*2, r*1.5);
    }
    else
    {
      ellipse(location.x, location.y, r*2, r*2);
    }
  }
}


