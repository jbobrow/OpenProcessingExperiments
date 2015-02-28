
class Particle
{
  PVector loc;
  PVector tloc;
  PVector vel;
  PVector acc;
  float mass;
  float maxVel;
  int pause;
  color c;
  int maxConn;
  
  Particle()
  {
    float x = random(-width/2, width/2);
    float y = random(-height/2, height/2);

    
    loc = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    mass = 10;
    maxVel = 6.0;
    pause = 0;
    maxConn = 0;
    c = color(random(128)+128, random(128)+64, random(128)+64);
  }
  
  Particle(PVector l_, PVector v_, PVector a_, float m_)
  {
    loc = l_;
    tloc = l_;
    vel = v_;
    acc = a_;
    mass = m_;
    maxVel = 6.0;
    pause = 0;
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
    stroke(c, 192);
    noFill();
    ellipse(loc.x, loc.y, 4, 4);
    strokeWeight(3);
    line(loc.x, loc.y, loc.x-(vel.x*8), loc.y-(vel.y*8));
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

