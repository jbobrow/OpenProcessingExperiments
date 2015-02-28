
class Orbital_Att
{
  PVector location; 
  float mass;
  float G; 
  
  Orbital_Att(PVector location, float mass, float G)
  {
    this.location = location;
    this.mass = mass;
    this.G = G;
  }
  
  PVector warp(Particle p) {
    PVector dir = PVector.sub(location,p.getLocation());
    float d = dir.mag();
    dir.normalize(); 
    float force = (G * mass * p.getMass()) / (d * d);
    dir.mult(force);
    return dir;
  }
  PVector getLocation() {
    return location;
  }
  void setLocation(PVector l){
    location = l;
  }
}

