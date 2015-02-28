
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float xoff;
  int timeLoops;
  float maxSpeed;
  int r,g,b;
  float randomNoise;

  Mover() {
    location = new PVector(random(width), height-20);
    velocity = new PVector(0,random(0,0.01));
    acceleration = new PVector(0,random(0,0.3));
    mass = 1;
    xoff = 0.0;
    timeLoops = 0;
    maxSpeed = 8;
    randomNoise = random(0.0,0.5);
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(r,g,b);
    xoff = xoff + .01;
    float x = location.x + noise(xoff+randomNoise) * 100;
    ellipse(x,location.y,12,19);
    line(x,location.y+10,x+3,location.y+18);
  }

  void checkEdges() {

    if (location.x > width) {
      // location.x = 0;
      velocity.x = velocity.x * -1;
    } else if (location.x < 0) {
      // location.x = width;
      velocity.x = velocity.x * -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
    
    if (location.y < 0) {
      velocity.y *= -.5;
      location.y = 0;
    }

  }
  
  int ceilingCollision() {
    if (location.y < 0) {
      return timeLoops = 4;
    }
    else {
      return timeLoops = 0;
    }
  }

}

