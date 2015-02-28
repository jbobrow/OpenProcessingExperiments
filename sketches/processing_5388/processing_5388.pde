
float maxAccel = 100;

class GravSphere extends Sphere {
  PVector last_pos;
  PVector vel;
  PVector accel;
  float mass;
  
  GravSphere(float radius, PVector initPos, float mass) {
    super(radius, initPos);
//    this.pos   = initPos;
    this.accel = new PVector(0, 0, 0);    
    this.mass  = mass;
  }
  
  void gravitateTowards(PVector location, float mass) {    
    float delta_x = location.x - this.pos.x;
    float delta_y = location.y - this.pos.y;
    float delta_z = location.z - this.pos.z;
    
    float dist_sq = sq(delta_x) + sq(delta_y) + sq(delta_z);    
   
    float magAccel   = mass/sqrt(dist_sq);
    if (magAccel > maxAccel) magAccel = maxAccel;
    
    // r-hat is better than angle projection!
    this.accel.x += magAccel*(delta_x/sqrt(dist_sq));
    this.accel.y += magAccel*(delta_y/sqrt(dist_sq));
    this.accel.z += magAccel*(delta_z/sqrt(dist_sq));
  }
    
  void update() {
    this.last_pos = new PVector(this.pos.x, this.pos.y, this.pos.z);
    this.pos = PVector.add(this.pos, this.accel);
    
    // WTF is this in terms of Physics? Maybe a drag coefficient?
    this.accel = PVector.mult(this.accel, 0.9);
  }
}

