
// Tweak of Daniel Shiffman's Flocking sketch 


Flock flock;

void setup() {
  size(600, 600);
  flock = new Flock();

  // Add an initial set of boids into the system
  for (int i = 0; i < 250; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
}

void draw() {
  background(0);
  flock.run();
}




// The Boid class

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  int R, G, B;

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);

    //float angle = random(PI);
    // velocity = new PVector(cos(angle), sin(angle));
    velocity = new PVector(random(100), random(100));

    location = new PVector(x, y);

    r = random(1, 8);
    maxspeed = 2;
    maxforce = 0.03;
    R = 255;
    G = 255;
    B = 0;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
    membrane();
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
    PVector dir = direction(boids);

    // Arbitrarily weight these forces
    sep.mult(2.5);
    ali.mult(0.5);
    coh.mult(1.0);
    dir.mult(1.0);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(dir);
  }

  // Method to update location
  void update() {


    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle

    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);


    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up

    fill(R, G, B, 150);
    noStroke();
    pushMatrix();
    rotate(theta/20);
    quad(location.x, location.y, location.x+2*r, location.y+2*r, location.x, location.y+4*r, location.x-2*r, location.y+2*r);

    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  void membrane() {
    if (location.y <= height/4-50) {
      R = 100;
      G = 178;
      B = 233;
    } else if (location.y > height/4-50 && location.y <= height/4 ) {
      R = 255;
      G = 255;
      B = 0;
    } else if (location.y > height/4+80 && location.y <= height/4 +200) {
      R = 255;
      G = 255;
      B = 255;
    } else if (location.y > height/4+250 && location.y <= height/4 +350) {
      R = 63;
      G = 42;
      B = 218;
    } else {
      R = 100;
      G = 178;
      B = 233;
    }
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0;
    PVector steer = new PVector(0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
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
    PVector sum = new PVector(0, 0);
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
      return new PVector(0, 0);
    }
  }

  // Direction  
  PVector direction (ArrayList<Boid> boids) {
    float neighbordist = 600;   
    PVector mouse = new PVector(mouseX, mouseY); 
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(mouse, location); 
      if ((d > 0) && (d <= neighbordist)) {
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(mouse, location); //calculate difference between mouse and boid location, create new vector
      steer.limit(maxforce);
      return steer; //return the new vector for use
    } else {
      return new PVector(0, 0);
    }
  }

}
// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids
 

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
   
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
   
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
  

}



