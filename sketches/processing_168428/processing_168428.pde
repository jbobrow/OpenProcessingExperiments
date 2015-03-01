
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
 
 
 
 
 
Flock flock;
//Minim minim;
//AudioInput in;

void setup() {
  size(800, 800);
  //minim = new Minim(this);
  //in = minim.getLineIn();
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++)
  {
    flock.addBoid(new Boid(width*.5, height*.5));
  }
}



void draw() {


  if (keyPressed) {
    if (key == ' ') {
      background(random(255));
      stroke(45);
      flock.addBoid(new Boid(width*2, height*2));
      flock.addBoid(new Boid(width*3, height*3));
      flock.addBoid(new Boid(width*1, height*2));
      flock.addBoid(new Boid(width*1, height*.5));
    }
  }
  flock.run();
}
// Add a new boid into the System
//doubleclick 
void mousePressed() {
  background(random(255));
  flock.addBoid(new Boid(mouseX, mouseY));
  
    

}




// The Boid class

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float lifespan;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    Boid(float x, float y) {
    acceleration = new PVector(255, 255);

    // This is a new PVector method not yet implemented in JS
    // velocity = PVector.random2D();

    // Leaving the code temporarily this way so that this example runs in JS
    float angle = random((PI/2));
    velocity = new PVector(cos(angle), sin(angle), tan(angle));

    location = new PVector(x, y);
    r = 2.0;
    maxspeed = 2;
    maxforce = 20.0;
    lifespan = 255.0;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(5);
    ali.mult(10.0);
    coh.mult(.5);

    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.div(55);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);

    // Above two lines of code below could be condensed with new PVector setMag() method
    // Not using this method until Processing.js catches up
    // desired.setMag(maxspeed);

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(150);
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up

    fill(255, 0, 0);
    stroke(20);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    //float mod = in.left.get(90)*200;
//
    vertex(0, -r*5);
    vertex(-r, r*65);
    vertex(r, r/45);
    endShape();
    popMatrix();
  }



  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width*r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r*8) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 10.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d/4< desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // steer.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(5, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // sum.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } else {
      return new PVector(45, 0);
    }
  }
}




// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

    Flock() {
    boids = new ArrayList<Boid>(45); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    stroke(35);
    boids.add(b);
  }
}



