
class Platform 
{
   public PVector pos;
   public Platform(double x, double y)
     { pos = new PVector((float)x,(float)y); }
   public void paint()
     { stroke(255,255,255);
       fill(64,64,64);
       rect(pos.x-20,pos.y,40,10); }
   public void scroll(double n)
     { pos.y += n; }
   public float yPos()
     { return pos.y; }
}

class SwayingPlatform extends Platform
{ 
  double theda; 
  public SwayingPlatform(float x, float y)
    { super(x,y); 
      theda = 0; }
  public void paint()
    { double step = cos((float)theda * PI) * 0.5;
      pos.x += step;
      theda += 0.0025;
      if (theda > 2) theda -= 2;
      super.paint(); }
  public void scroll(double n)
    { pos.y += n; }
  public float yPos()
    { return pos.y; }
}
    
class RaisingPlatform extends Platform
{ 
  double theda; 
  public RaisingPlatform(float x, float y)
    { super(x,y); 
      theda = 0; }
  public void paint()
    { double step = sin((float)theda * PI) * 0.5;
      pos.y += step;
      theda += 0.0025;
      if (theda > 2) theda -= 2;
      super.paint(); }
  public void scroll(double n)
    { pos.y += n; }
  public float yPos()
    { return pos.y; }
}

class SpinningPlatform extends Platform
{ 
  double theda; 
  public SpinningPlatform(float x, float y)
    { super(x,y); 
      theda = 0; }
  public void paint()
    { double stepX = cos((float)theda * PI) * 0.5;
      double stepY = sin((float)theda * PI) * 0.5;
      pos.x += stepX;
      pos.y += stepY;
      theda += 0.0025;
      if (theda > 2) theda -= 2;
      super.paint(); }
  public void scroll(double n)
    { pos.y += n; }
  public float yPos()
    { return pos.y; }
}

