
class Particle
{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  float a;
  float b;
  
  Particle()
  {
    loc = new PVector();
    vel = new PVector();
    acc = new PVector();
    mass = 10;
    maxVel = 2.0;
    a = 0;
    b = 0;
    setRandomLoc();
  }
  
  Particle(PVector l_, PVector v_, PVector a_, float m_)
  {
    loc = l_;
    vel = v_;
    acc = a_;
    mass = m_;
    maxVel = 3.5;
    a = 0;
    b = 0;
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
    a=(a+(0.01*vel.mag()))%TWO_PI;
    b=(b<24)?b+0.01:24;
  }
  
  void render()
  {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    rotateX(vel.x);
    rotateY(vel.y);
    box(4);
    popMatrix();
  }
  
  PVector calcForce(Particle p_) 
  {
    PVector dir = PVector.sub(p_.loc, loc);          
    float d = dir.mag(); 
    d = constrain(d, 255, 512);                      
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
  
  void setRandomLoc()
  {
    float x = random(-width/4, width/4);
    float y = random(-height/4, height/4);
    float z = random(-width/4, width/4);
    
    loc = new PVector(x, y, z);
  }
}

