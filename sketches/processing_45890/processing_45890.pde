
class Particle
{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  
  Particle(PVector l_, PVector v_, PVector a_, float m_)
  {
    loc = l_;
    vel = v_;
    acc = a_;
    mass = m_;
    maxVel = 4.0;
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
    //ellipse(loc.x, loc.y, 255, 255);
    strokeWeight(1);
    for (float angle=0.0; angle<TWO_PI; angle+=PI/100)
    {
      line(loc.x+cos(angle)*12, loc.y+sin(angle)*12, loc.x+cos(angle)*255, loc.y+sin(angle)*255);
    }
  }
  
  PVector calcForce(Particle p_) {
    PVector dir = PVector.sub(p_.loc, loc);          
    float d = dir.mag();                              
    d = constrain(d, 30, 40.0);                      
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

