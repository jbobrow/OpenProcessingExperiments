
// A simple Particle class

 
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = random(20.0);
    timer = 100.0;
  }

  void run() { 
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

 
  void render() {
    ellipseMode(CENTER);
    stroke(255);//,timer
    fill(255,125,50,timer);
    ellipse(loc.x,loc.y,r,r);
    displayVector(vel,loc.x,loc.y,10);
  }
  
  boolean dead() {
    if (timer <= 0.1) {
      return true;
    } else {
      return false;
    }
  }
  
   void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    translate(x,y);
    stroke(255);
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    popMatrix();
  } 

}


