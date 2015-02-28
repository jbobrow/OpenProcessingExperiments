
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    float n = noise(lifespan) * 255.0;
    //stroke(143,102,0,map(lifespan, 255.0, -0.1, 70.0, 0.0));
    stroke(143,102,0,n*0.9);
    fill(242,222,107,lifespan*(n*0.9));
    //float ellipseSize = map(n, 1, 0, 0.5,1.0);
    ellipse(location.x,location.y,n*0.09,n*0.09);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

