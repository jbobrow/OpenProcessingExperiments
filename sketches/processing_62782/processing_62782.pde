
frac F;

void setup()
{
  size(800, 600);
  background(255);
  F=new frac();
}
void draw()
{
  F.show();
}

class frac
{
  ArrayList l;

  frac()
  {
    //print("\n"+width+" "+height);
    l = new ArrayList();

    PVector p = new PVector();
    p.x=width/2+20;
    p.y=height/2;

    l.add(p);

    PVector r = new PVector();
    r.x=width/2-20;
    r.y=height/2;

    l.add(r);

    p = (PVector) l.get(0);
    r = (PVector) l.get(1);

    //print("\n"+p.x+" "+p.y);
    //print("\n"+r.x+" "+r.y);

    stroke(0);
    line(p.x, p.y, r.x, r.y);
  }
  void show()
  {
    if (l.size()>0)
    {
      PVector p = (PVector)l.get(0);
      //print("\n"+l.size());
      //print(p.x+" "+p.y);
      PVector u = new PVector();
      u.x = p.x-width/2; 
      u.y = p.y-height/2;
      float a = atan2(p.y-height/2,p.x-width/2);
      l.remove(0);

      PVector r = new PVector();
      PVector q = new PVector();
      float b = 0.9;
      r.x = p.x - sin(a)*u.mag()*b;
      r.y = p.y + cos(a)*u.mag()*b;
      
      q.x = p.x + sin(a)*u.mag()*b;
      q.y = p.y - cos(a)*u.mag()*b;
      
      l.add(r); l.add(q);
      line(r.x,r.y,q.x,q.y);
    }
  }
}
