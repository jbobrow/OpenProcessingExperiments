
class Branch
{
  PVector loc; // location start
  PVector nLoc; // Location end
  float s; // size
  float ts; // temporary size that gets bigger
  float nx, ny, nz;
  float a;
  boolean isComplete;
  boolean isFlowering;
  
  Branch(PVector l_, float s_, float a_)
  {
    loc = l_;
    s = s_;
    ts = 0.0;
    a = a_;
    isComplete = false;
    isFlowering = (s<8) ? true : false;
    
    nx = cos(a)*s+loc.x;
    ny = sin(a)*s+loc.y;
    nz = cos(a)*s+loc.z;
    nLoc = new PVector(nx, ny, nz);
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {    
    if (ts<s)
    {
      ts++;
    }
    else
    {
      isComplete = true;
    }
    
  }
  
  void render()
  {
    strokeWeight(ts/10);
    for (float f=0; f<ts; f+=0.5)
    {
      nx = cos(a)*f+loc.x;
      ny = sin(a)*f+loc.y;
      nz = cos(a)*f+loc.z;
      point(nx, ny, nz);
    }
  }
}

