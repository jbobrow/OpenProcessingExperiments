
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
 
  Particle(PVector l) {
    acceleration = new PVector(0,0.1);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();     //keeps the original copy of the location
    lifespan = 20;
  }
 
  void run() {
    update();
    display();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }
 
  void display() {
    pushMatrix();
    float mx = constrain(mouseX, 0, (4*width/5)-20);
    ellipse(location.x,location.y, 2, 2);
    line(mx, mouseY, location.x, location.y);
    popMatrix();
  }
 
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

