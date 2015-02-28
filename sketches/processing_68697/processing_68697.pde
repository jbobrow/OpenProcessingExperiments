
// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A simple Particle class

class Particle {
  PVector location; //vector to store location of particle
  PVector velocity; //vector to store vel of particle
  PVector acceleration; //vector to store acc of particle
  float lifespan; //decimal number to store age or particle
  color colour;

  ParticleSystem parent; //keep track of which particle system
  //the particle is in

  //constructor

  //code to define a new instance of the particle class
  //Particle p = new Particle(); WILL NOT RUN
  //because we need to provide all of the arguments to
  //the constructor function - e.g. a PVector
  //AND the parent particle system

  Particle(PVector l, ParticleSystem p) {

    //assign values to properties of our new Particle instance
    parent = p;

    acceleration = new PVector(0, 0); 
    //all particles have the same
    //acceleration, moving downwards// gravity

    velocity = new PVector(random(-2, 2), random(-2, 2));
    //all particles have a random initial velocity

    location = l.get(); //copy the location vector so that we are 
    //not using a REFERENCE to the supplied location vector

    //location is specified using the vector supplied to the constructor

    lifespan = 255.0;


    colour = color(location.x, location.y, 100);
  }

  //one function to rule them all
  void run() {
    checkSystem();
    update(); //move the particle
    display(); //draw the particle
  }

  // Method to update location
  void update() {

    //update the velocity - direction and speed that our particle is 
    //travelling in

    addForce(gravity);

    velocity.add(acceleration);

    //update the location
    location.add(velocity);

    //check boundary
    checkBoundary();

    //reduce the lifespan
    lifespan -= 2.0;
  }

  void addForce(PVector f) {
    acceleration.add(f);
  }

  // Method to display
  void display() {
    stroke(colour, constrain(lifespan, 0, 255));
    strokeWeight(strokeWidth);
    point(location.x, location.y);
    //fill(127,lifespan);
    //ellipse(location.x,location.y,12,12);
  }

  // Is the particle still useful?

  // this makes the particle system more efficient - we are not
  // creating an infinite number of particles

  // maintains a balance within the system (adding + removing)

  // adds a behaviour to the particle that could be controlled
  // by external events/other behaviours/the environment

  boolean isDead() { //function that returns a boolean object

    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }

  //check the position of other particles in the parent system
  void checkSystem() {

    //loop through all the particles in the system
    for (Particle p : parent.getParticles()) {
      if (location.dist(p.location)<repelDistance) {
        //create a repulsive force
        PVector repel = PVector.sub(location, p.location);
        repel.mult(-repelScale);
        addForce(repel);
      }
    }
  }

  void checkBoundary() {
    if (location.x<0 ||location.x>width) {
      velocity.x *= -1;
    }
    if (location.y<0 ||location.y>height) {
      velocity.y *= -1;
    }
  }
}


