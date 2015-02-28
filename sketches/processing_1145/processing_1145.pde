
class Attractor {
  Vector3D loc;  
  float mass;
  float gConst;
  boolean on;
  
  Attractor(Vector3D l, float m, float g) {
    loc = l.copy();
    mass = m;
    gConst = g;
    on = true;
  }
  
  void run() {
    if(on) {
      //render();
    }
  }
  
  void render() {
    ellipseMode(CENTER);
    noStroke();
    fill(0, 0, 0, 255);
    ellipse(loc.x, loc.y, mass, mass);
  }
  
  Vector3D calcGravForce(Particle p) {
    
    Vector3D dir = new Vector3D();
    dir = dir.sub(loc, p.getLoc());                     // Direction
    float d = dir.magnitude();                          // Distance
    d = constrain(d, mass, 25.0f);                     // Limit extremes
    dir.normalize();                                    // Normalize distance
    float f = (gConst * mass * p.getMass()) / (d * d);  // Gravitational force magnitude
    dir.mult(f);                                        // vector = magnitude * direction
    return dir;                                         
  }
}

