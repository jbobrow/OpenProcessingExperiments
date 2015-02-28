
class GravParticle extends Particle
{
  float a;
  
  GravParticle(PVector l_, float m_)
  {
    loc = l_;
    vel = new PVector();
    acc = new PVector();
    mass = m_;
    maxVel = 8.0;
    a = random(TWO_PI);
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    acc.x = cos(a)*4;
    a = (a+0.1)%TWO_PI;
    
    vel.add(acc);
    vel.limit(maxVel);
    loc.add(vel);
    acc.mult(0);
  }
  
  void render()
  {
    stroke(255, 0, 0);
    ellipse(loc.x, loc.y, 8, 8);
  }
}

