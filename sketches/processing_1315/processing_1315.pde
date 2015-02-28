
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float ms;
  float distance;
  
  Particle(PVector a, PVector v, PVector l, float ms_) {
    acc = a;
    vel = v;
    loc = l;
    ms = ms_;
  }
 
  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc = new PVector();   
  }
 
  void render() {
    float cl = map(vel.mag(), 0, 5.0, 0, 60);  
    float al = map(vel.mag(), 0, 1.2, 0, 30); 
    float m = map(millis(), 0, 20000, 0, 30);   
    if(millis() < 20000){            
        stroke(cl, 99, 99, m);
    }
    else stroke(cl, 99, 99, al);   
    point(loc.x,loc.y);
  }
 
 void add_force(PVector force) { 
    force.div(ms);
    vel.add(force);
  }  
  PVector getLocation() {
    return loc;
  } 
  void move(PVector target) {
    acc.add(steer(target));
  }  

  PVector steer(PVector target) {
    PVector steer;
    PVector desired = PVector.sub(target,loc);
    float d = desired.mag();
    desired.normalize();
    desired.mult(10.0);
    steer = PVector.sub(desired,vel);
    steer.limit(4.0f);
    steer.div(ms);
    return steer;
  }
}



