
class Attractor {
  float mass;  
  float a;     
  Vector3D loc;  
  
  Attractor(Vector3D l_,float m_, float a_) {
    loc = l_.copy();
    mass = m_;
    a = a_ * -1;
  }

  void run() {
    if (a < 0) {
      render();
    }
  }

  Vector3D calcForce(Particle p) {
    Vector3D dir = new Vector3D();
    dir = dir.sub(p.getLoc(), loc);
    float dis = dir.magnitude();
    dis = constrain(dis, mass*2, mass*10);
    float f = (a * mass * p.getMass()) / (dis * dis);
    dir.normalize();
    dir.mult(f);
    return dir;
  }

  void render() {
    ellipseMode(CENTER);
    fill(32, 128);
    ellipse(loc.x, loc.y, mass*1.5, mass*1.5);
    fill(255, 128);
    ellipse(loc.x, loc.y, mass/2, mass/2);
    fill(64, 128);
    ellipse(loc.x, loc.y, mass/3, mass/3);
  }
}

