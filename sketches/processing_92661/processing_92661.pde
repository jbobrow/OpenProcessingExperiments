

class Particle {

  PVector location;
  PVector velocity,velocityUp;
  PVector acceleration;
  
  float lifespan;
  float mass = 1; 
  float si=random(15, 30);  
  float rotation;
  float spin;
  int value=0;
  float r=random(0, 360);
  boolean mouse=false;
  boolean drawOrNot=true;


  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(1, 1), random(0.5, 1));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //  lifespan -= random(0.5, 1);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }



  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);

    // ellipse(location.x, location.y, 12, 12);
  }

  // Is the particle still useful?
  
  
  
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}



