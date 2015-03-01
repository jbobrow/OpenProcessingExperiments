
class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  float r;

  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float wiggle;
  float wAngle;

  Boid(PVector l, float ms, float mf) {
    acc = new PVector(0, 0);
    vel = new PVector(cos(wAngle), sin(wAngle));
    loc = l.get();
    r = 3.0;
    maxspeed = 7;
    maxforce = 0.4;
    wAngle = random(TWO_PI);
  }

  void run(ArrayList boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(2.5);
    ali.mult(1.0);
    coh.mult(0.75);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0.5);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    acc.add(steer(target, false));
    return steer;
  }


  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector desired = PVector.sub(target, loc);  // A vector pointing from the location to the target
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    
steer.limit(maxforce);
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + radians(40);

    wAngle --;
    wAngle = wAngle%360;
    wiggle = sin(radians(wAngle)) * 70;
    r = abs((wiggle));

    fill(wAngle%360, 220, 255, 10);
    stroke((wAngle+360)%180, 255, 255, 50);
    ellipse(loc.x, loc.y, r, r);

  }

  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0; i < boids.size (); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
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
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) {
    float neighbordist = 30;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (int i = 0; i < boids.size (); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < neighbordist)) {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) {
    float neighbordist = 30.0;
    PVector sum = new PVector(0, 0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0; i < boids.size (); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum, false);  // Steer towards the location
    }
    return sum;
  }
}


 
// Flock class

 
class Flock {
  ArrayList boids; // An arraylist for all the boids
 
  Flock() {
    boids = new ArrayList(); // Initialize the arraylist
  }
 
  void run() {
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i); 
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }
 
  void addBoid(Boid b) {
    boids.add(b);
  }
 
}


 
Flock flock;
 
void setup() {
  size(800,800);
  colorMode(HSB);
  background(0);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 100; i++) {
    flock.addBoid(new Boid(new PVector(width/2,height/2),7.0,0.05));
  }
}
 
void draw() {
 // background(0);
 //fill(0, 50);
// rect(0,0,width,height);
  
  flock.run();
}
 
// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(new PVector(mouseX,mouseY),15.0,0.05f));
}



