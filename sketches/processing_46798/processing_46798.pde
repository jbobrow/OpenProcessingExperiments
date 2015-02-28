
class Attractor
{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  float a;
  
  Attractor()
  {
    loc = new PVector();
    vel = new PVector();
    acc = new PVector();
    mass = 24;
    maxVel = 8.0;
    a = 0;
  }
  
  Attractor(PVector l_, PVector v_, PVector a_, float m_)
  {
    loc = l_;
    vel = v_;
    acc = a_;
    mass = m_;
    maxVel = 8.0;
    a = 0;
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    float x = cos(a)*128;
    float y = sin(a)*128;
    loc = new PVector(x, y);
    a+=0.01;
  }
  
  void render()
  {
    ellipse(loc.x, loc.y, mass, mass);
  }
  
  PVector calcForce(Particle p_) {
    PVector dir = PVector.sub(p_.loc, loc);
    
    float d = dir.mag();                              
    d = constrain(d, 255, 360);
    
    dir.normalize();
    float force = (G*mass*p_.mass)/(d*d);
    dir.mult(force);                                  
    return dir;
  }
  
  void applyForce(PVector f_)
  {
    f_.div(mass);
    acc.add(f_);
  }
}

