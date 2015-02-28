


class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
/*
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a;
    vel = v;
    loc = l;
    r = r_;
    timer = 100.0;
  }
  */
  Particle(PVector l) {
    
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 10.0;
    timer = 150.0;
  }
  

   
  void run() {
    update();
    render();
  }
 
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc = new PVector();
    timer -= 0.5f;
  }
  
  //I'm bi-winning. Winning here, winning there!
  
  void render() {
   // stroke(#ffffff, timer);
    point(loc.x,loc.y);
  }
  
 void applyForce(PVector force) {
    acc.add(force);
  } 
 
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


