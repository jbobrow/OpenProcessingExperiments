
class Particle
{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  
  Particle()
  {
    loc = new PVector();
    vel = new PVector();
    acc = new PVector();
    mass = 1280;
    maxVel = 0.0;
  }
  
  Particle(float x_, float y_)
  {
    loc = new PVector(x_, y_);
    vel = new PVector();
    acc = new PVector();
    mass = 10.0;
    maxVel = 8.0;
  }
  
  Particle(PVector l_, PVector v_, PVector a_, float m_)
  {
    loc = l_;
    vel = v_;
    acc = a_;
    mass = m_;
    maxVel = 8.0;
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    vel.add(acc);
    vel.limit(maxVel);
    loc.add(vel);
    acc.mult(0);
  }
  
  void render()
  {
    point(loc.x, loc.y);
    //ellipse(loc.x, loc.y, 4, 4);
  }
  
  PVector calcForce(Particle p_) {
    PVector dir = PVector.sub(p_.loc, loc);
    
    float d = dir.mag();                              
    d = constrain(d, 128, 255);
    
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
  
  void setLoc(float x_, float y_)
  {
    loc = new PVector(x_, y_);
  }
}

