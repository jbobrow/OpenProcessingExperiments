
// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float rad;
  float timer;

  // One constructor
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    rad = r_;
    timer = 100.0;
  }

  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    rad = 10;
    //r = 10.0;
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

  // Method to display
  void render() {
    ellipseMode
    (CENTER);
    noStroke();
    //  float rad = dist (width/2,height/2,mouseX,mouseY);
    float r = dist (0,height,mouseX,mouseY);
    float g = dist (width,height,mouseX,mouseY);
    float b = dist (0,0,mouseX,mouseY);
    fill(r,g,b,50);
    //stroke(255,timer);
    //fill(100,timer);
    ellipse(loc.x,loc.y,rad,rad);//random(100));

  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  
}


