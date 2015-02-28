
// Particle class for 2D space.
// Mark Brand, 22 march 2009.

class Particle 
{
  PVector acc;
  PVector vel;
  PVector loc;
  float mass;
  float lim;
  boolean isLimited;
  color c;

  // Constructor
  Particle(PVector a_, PVector v_, PVector l_, float m_)
  {
    acc = a_.get();
    vel = v_.get();
    loc = l_.get();
    mass = m_;
    lim = 0;
    isLimited = false;
    c = color(255);
  }
  
  Particle(PVector a_, PVector v_, PVector l_)
  {
    acc = a_.get();
    vel = v_.get();
    loc = l_.get();
    mass = 10;
    lim = 0;
    isLimited = false;
    c = color(255);
  }

  Particle(PVector l_)
  {
    acc = new PVector();
    vel = new PVector();
    loc = l_.get();
    mass = 10;
    lim = 0;
    isLimited = false;
    c = color(255);
  }
  
  void run() 
  {
    update();
    render();
  }
  
  void update()
  {
    vel.add(acc);
    if (isLimited) vel.limit(lim);
    loc.add(vel);
  }

  void render()
  {
    drawStar(pg1, loc.x, loc.y);
  }

  void renderVector(PVector v_, float s_)
  {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading2D());   

    float len = v_.mag()*s_; //get magnitude and scale

    line(0, 0, len, 0);
    line(len, 0, len-4, 2);
    line(len, 0, len-4, -2);
    popMatrix();
  }

  void setLimit(float l_)
  {
    lim = l_;
    isLimited = true;
  }
  
  void addForce(PVector v_) 
  {
    // force=mass*acc, added acc=force/mass
    PVector force = v_.get();
    force.div(mass);
    acc.add(force);
  }
  
  void setColor(color c_) {
    c = c_;
  }
}

