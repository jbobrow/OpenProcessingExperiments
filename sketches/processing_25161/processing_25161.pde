
class Firefly
{
  PVector[] aCurve;
  int origx,origy,w,h,d;
  float t,x,y,z,f,sp,csp;
  
  Firefly(int origx, int origy, int w, int h, int d)
  {
    f = 0;
    this.d = d;
    this.origx = origx;
    this.origy = origy;
    this.h = h;
    this.w = w;
    sp = round(random(1,8));
    csp = random(0.01,0.03);
    
    aCurve = new PVector[4];
    for(int i = 0; i < 4; i++)
      aCurve[i] = new PVector(round(random(origx,w)),round(random(origy,h)),round(random(-d,d)));
    //strokeWeight(3);
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
      z = curvePoint(aCurve[0].z, aCurve[1].z, aCurve[2].z, aCurve[3].z, t);
      fill(0,f,0);
      stroke(0,f,0);
      pushMatrix();
      translate(x,y,z);
      sphere(3);
      popMatrix();
      //point(x,y,z);
      t += csp;
      f += sp;
    }
    else
      setContPoints();
  }
  
  void setPoints()
  {
    for(int i = 0; i < 4; i++)
      aCurve[i].set(round(random(origx,w)),round(random(origy,h)),round(random(-d,d)));
    t = 0;
  }
  
  void setContPoints()
  {
    for(int i = 0; i < 3; i++)
      aCurve[i].set(aCurve[i+1]);
    aCurve[3].set(round(random(origx,w)),round(random(origy,h)),round(random(-d,d)));
    t = 0;
  }
}

