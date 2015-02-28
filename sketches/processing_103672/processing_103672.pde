
/**
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Mover" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by affecting the acceleration (in this case towards the mouse)
 *
 * For more examples of simulating motion and physics with vectors, see 
 * Simulate/ForcesWithVectors, Simulate/GravitationalAttraction3D
 */

// A Mover object
Mover mover;

void setup() {
  size(800,800);
  mover = new Mover(); 
}

void draw() {
  
  fill(0,140);
  noStroke();
  rect(0,0,width,height);
  // Update the location
  mover.update();
  // Display the Mover
  mover.display(); 

  
  println(mover.velocity);
}

/**
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Mover" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by affecting the acceleration (in this case towards the mouse)
 */


class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector g;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    g = new PVector(0,0);
    topspeed = 200;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector acceleration =PVector.add( PVector.sub(mouse, location),g);
    if (mousePressed) {
      velocity.set(0, 0);
      acceleration = PVector.sub(location,mouse );
      
    }
    
      // Compute a vector that points from location to mouse
      
      
   
      // Set magnitude of acceleration
      acceleration.setMag(1);
    
      // Velocity changes according to acceleration
      velocity.add(acceleration);
      // Limit the velocity by topspeed
      velocity.limit(topspeed);
      // Location changes by velocity
      location.add(velocity);
      
    
  }

  void display() {
    stroke(255);
    float d= constrain(dist(mouseX, mouseY, location.x, location.y),70,1000);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 48, 48);
    strokeWeight(1500/d);
    line(mouseX, mouseY, location.x, location.y);
  }
}
