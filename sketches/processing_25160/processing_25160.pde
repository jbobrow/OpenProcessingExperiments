
class Firefly
{
  PVector[] aCurve;
  int minx,miny,maxx,maxy;
  float t,x,y,f,sp,csp;
  
  Firefly(int origx, int origy, int w, int h)
  {
    minx = origx;
    miny = origy;
    maxx = w;
    maxy = h;
    f = 0;
    sp = round(random(1,8));
    csp = random(0.01,0.03);
    
    aCurve = new PVector[4];
    for(int i = 0; i < 4; i++)
      aCurve[i] = new PVector(round(random(minx,maxx)),round(random(miny,maxy)),0);
  }
  
  void draw()
  {
    if(t <= 1)
    {
      if(f>255)
      {
        sp = -sp;
        f = 255;
      }
      if(f<0)
      {
        sp = -sp;
        f = 0;
      }
      x = curvePoint(aCurve[0].x, aCurve[1].x, aCurve[2].x, aCurve[3].x, t);
      y = curvePoint(aCurve[0].y, aCurve[1].y, aCurve[2].y, aCurve[3].y, t);
      fill(0,f,0);
      ellipse(x,y,3,3);
      t += csp;
      f += sp;
    }
    else
      setContPoints();
  }
  
  void setPoints()
  {
    for(int i = 0; i < 4; i++)
      aCurve[i].set(round(random(minx,maxx)),round(random(miny,maxy)),0);
    t = 0;
  }
  
  void setContPoints()
  {
    for(int i = 0; i < 3; i++)
      aCurve[i].set(aCurve[i+1]);
    aCurve[3].set(round(random(minx,maxx)),round(random(miny,maxy)),0);
    t = 0;
  }
}

