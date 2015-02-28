
class Particle {
  private Vector3D acc;
  private Vector3D vel;
  private Vector3D loc;
  private float mass;
  private float g;
  color c;
  
  Particle(Vector3D a_, Vector3D v_, Vector3D l_, float m_) {
    acc = a_.copy();
    vel = v_.copy();
    loc = l_.copy();
    mass = m_;
    g = mass/100;
    c = color(loc.x, loc.y, 255);
  }
  
  Particle() {
    acc = new Vector3D(0.0, 0.0, 0.0);
    acc = new Vector3D(0.0, 0.0, 0.0);
    acc = new Vector3D(0.0, 0.0, 0.0);
    mass = 0;
  }
  
  Vector3D getAcc() {
    return acc;
  }
  
  Vector3D getVel() {
    return vel;
  }
  
  Vector3D getLoc() {
    return loc;
  }
  
  float getMass() {
    return mass;
  }
  
  Vector3D calcGravForce(Particle p) {
    Vector3D dir = new Vector3D();
    dir = dir.sub(p.getLoc(), loc);
    float dis = dir.magnitude();
    dis = constrain(dis, mass, mass*2);
    float f = (g * mass * p.getMass()) / (dis * dis);
    dir.normalize();
    dir.mult(f);
    return dir;
  }
  
  void addForce(Vector3D v) {
    v.div(mass);
    acc.add(v);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.setXYZ(0.0f, 0.0f, 0.0f);
  }
  
  void render() {
    noStroke();
    fill(c, 255);
    ellipse(loc.x, loc.y, mass/2, mass/2);
  }
}
  

