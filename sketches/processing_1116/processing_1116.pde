
class Particle {
  PVector or;
  PVector loc;
  PVector vel;
  PVector acc;
  float ms;
  float distance;
  float timer;

  Particle(PVector a, PVector v, PVector l, PVector o, float ms_) {
    acc = a;
    vel = v;
    loc = l;
    ms = ms_;
    or = o;
    timer = random(400,500);
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc = new PVector();
    timer -= 1.0;
  }
 
  void render() {
    stroke(1, 100, 0, 100);
    point(loc.x,loc.y);
  }
 
 void add_force(PVector force) { 
    force.div(ms);
    vel.add(force);
  }  
 
 float getMass() { 
    return ms; 
  }  
  
  PVector getLocation() {
    return loc;
  }
  PVector getOrigin() {
    return or;
  }
  PVector getVelocity() {
    return vel;
  }
  void setLocation(PVector l){
    loc = l;    
  }

  void setAcceleration(PVector a){
    acc = a;
  }


  boolean dead() {
    if (timer <= 0) {
      return true;
    } else {
      return false;
    }
  }
}



