
class Firework
{
  PVector loc;
  PVector acc;
  PVector vel;
  float r;
  float yInput;
  
  Firework(float x, float y)
  {
    r = 3;
    
    loc = new PVector(x, height + r);
    acc = new PVector(0, 0.05);
    vel = new PVector(0, -5);
    
    yInput = y;
  }
  
  void Update()
  {
    vel.add(acc);
    loc.add(vel);
    
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, r, r * 4);
    fill(255, 255, 0, 30);
    ellipse(loc.x, loc.y, r * 3, r * 6 );
  }
  
  boolean Dead()
  {
    if (loc.y <= yInput || vel.y >= 0)
      return true;
    else
      return false;
  }
}

