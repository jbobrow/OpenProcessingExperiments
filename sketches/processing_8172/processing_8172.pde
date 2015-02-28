
class Particle{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Particle() {
    location = new PVector(random(-200, 200),random(-100,100),10);
    velocity = new PVector();
    acceleration = new PVector();
    mass = random(0.5,1.0);
  }

  void update() {
  velocity.add(acceleration);
  location.add(velocity);
  acceleration = new PVector();
  velocity.x = cos(noise(location.x*.02,location.y*.02, millis()*.0002)*TWO_PI); 
  velocity.y = sin(noise(location.x*.02,location.y*.02, millis()*.0002)*TWO_PI);
  }

  void render() {
    update();
    float cl = map(getVel().y, -0.9, 0.9, 99, 45);
    stroke(0, 100, 100, cl);
    strokeWeight(0.5f);
    line(location.x,location.y,location.z,location.x,location.y,location.z-20);
  }
  
  PVector getVel() { 
    return velocity; 
  }   
  
  void add_force(PVector force) {
    force.div(mass);  
    acceleration.add(force); 
  } 
  
  boolean pop() { 
    if (((location.x > 200) || (location.x < -200)) || ((location.y > 100) || (location.y < -100)) || ((location.z > 10) || (location.z < -10))){ 
      return true;
    }
    else return false;   
  }  
  
}




