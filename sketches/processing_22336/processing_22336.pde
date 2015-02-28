
// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A simple Particle class
float theta = 0.0;

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,.5);
    velocity = new PVector(sin(theta),sin(theta));
    
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
    checkEdges();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    theta += 0.1;
  }

  // Method to display
  
  
  void display() {
  
    stroke(lifespan);
    line(location.x,0,0,location.y);
    
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
 
  void checkEdges(){
  if (location.x> width){
   velocity.x *= -1; 
  }else if (location.x<0){
   velocity.x *=-1; 
  }
  
  if (location.y>height){
   velocity.y *=-1;
  
  }else if (location.y<0){
  velocity.y *=-1; 
  }
  
     
  }
  
   
}



