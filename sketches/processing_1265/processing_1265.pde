
class Attractor {
  PVector loc;
  float mass;
  float g;
  
  Attractor(PVector l_, float m_, float g_) {
    loc = l_.get();
    mass = m_;
    g = g_;
  }
  
  PVector getGravForce(Particle p_) {
    PVector dir = new PVector();
    dir = dir.sub(loc, p_.loc);
    float d = dir.mag();
    d = constrain(d, mass, 25.0f);
    dir.normalize();
    float f = (g*mass*p_.mass)/(d*d);
    dir.mult(f);
    return dir;
  }
}

