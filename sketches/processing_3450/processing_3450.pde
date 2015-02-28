
class Particle {
  PVector loc, vel, acc, seek;
  float timer, maxspeed, maxforce, threshold;
  ArrayList targets;
  
  Particle(PVector l, ArrayList t) {
    loc = l.get();
    targets = (ArrayList) t;
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
    timer = 6000.0;
    maxspeed = 10;
    maxforce = 0.03;
    threshold = 300.0;
  }
  
  void update() {
    
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    timer -= 1.0;
    acc.set(0, 0, 0);
  }
  
  PVector seek(ArrayList targets) {
    PVector accu = new PVector(0, 0); //Empty vector to store accumulation of "seeks"
    
    for (int i = 0; i < targets.size(); i++) {
       PVector target = (PVector) targets.get(i);
       PVector desired = target.sub(target, loc);
       float d = desired.mag();
       if ((d > threshold/2) && (d < threshold)) {
          desired.normalize();
          desired.mult(maxspeed);
          seek = PVector.sub(desired, vel);
          seek.limit(maxforce);
          seek.div(d);
          }
        else {
           seek = new PVector(0, 0);
        }
        accu.add(seek); //Add all seeks for all targets together
        accu.limit(maxforce);
     }   
     return accu; //Return accumulation of all targets
  }
  
  void steer(PVector target) {
    acc.add(seek(targets));
  }
  
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  void render() {
      stroke(0, 1);
      line(loc.x, loc.y, loc.x, loc.y);
  }
  
  void run() {
    update();
    render(); 
  }
}

