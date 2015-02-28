
class Branch
{
  PVector loc; // location start
  PVector nLoc; // Location end
  float s; // size
  float ts; // temporary size that gets bigger
  float nx, ny;
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
    nLoc = new PVector(nx, ny);
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
    if (isFlowering)
    {
      strokeWeight(1);
      noFill();
      for (float f=0; f<ts; f+=0.5)
      {
        stroke(random(64)+128, random(64, 128)+64, random(64, 192), 128);
        nx = cos(a)*f+loc.x;
        ny = sin(a)*f+loc.y;
        float r = random(-800, 16);
        if (r>10) ellipse(nx, ny, r*2, r*2);
        stroke(random(64)+128, random(64, 128)+32, random(64, 192));
        point(nx, ny);
      }
    }
    else
    {
      stroke(0);
      strokeWeight(ts/10);
      for (float f=0; f<ts; f+=0.5)
      {
        nx = cos(a)*f+loc.x;
        ny = sin(a)*f+loc.y;
        point(nx, ny);
      }
    }
  }
}

