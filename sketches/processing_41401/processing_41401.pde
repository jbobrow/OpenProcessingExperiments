
// The Boid class

class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    Boid(PVector l, float ms, float mf) {
    acc = new PVector(0,0);
    vel = new PVector(random(-1,1),random(-1,1));
    loc = l.get();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
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
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
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
    // Reset acceleration to 0 each cycle
    acc.set(0,0,0);
  }

  void seek(PVector target, float mag_percent) {
    acc.add(steer(target,false, mag_percent));
  //  acc = steer(target);
  }

  void arrive(PVector target, float mag_percent) {
    acc.add(steer(target,false, mag_percent));
  // acc = steer(target);
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown, float mag_percent) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      desired.mult(maxspeed);
      steer = PVector.sub(desired, vel);
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    //this makes the ants flee when the minute gets close to ending
    int s = second();
    if (s>56) {
      steer = PVector.add(desired,vel);
      steer = PVector.mult(desired, -1); //this is fleeing, the inverse of seeking
    }
    steer.mult(mag_percent/100);
    return steer;
  }

  void render() {
    // Drawing an ant rotated in the direction of velocity
    float theta = vel.heading2D() - PI/2;
   fill(0);
    noStroke();
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    ellipse(r, -r, r*10, r*10);
    ellipse(r+10, -r+10, r*6, r*6);
    ellipse(r+18, -r+18, r*7, r*7);
    strokeWeight(2);
    stroke(0);
    line(r*8, -r, r, r*8);
    line(r*2, -r, r*8, r*12);
    line(r*2, -r, r*14, r*6);
    line(r*2, -r*10, r*5, -r*2);
    line(r*2, r*4, -r*8, -r);
    popMatrix();
    
  }

  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+(r*3);
    if (loc.y < -r) loc.y = height+(r*3);
    if (loc.x > width+(r*3)) loc.x = -r;
    if (loc.y > height+(r*3)) loc.y = -r;
    
//    if (s>56) {
//      loc.x = width+r;
//    }
//    if (s>56) {
 //     loc.y = height+r;
 //   }
 //   if ((s>56) && (loc.x>width+r)) {
 //     fill(255);
 //   }
//    if ((s>56) && (loc.y>height+r)) {
//      fill(255);
//    }
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    float desiredseparation = 20.0;
    PVector sum = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div((float)count);
      
    }
    return sum;
    // As long as the vector is greater than 0
   /* if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;*/
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) {
    float neighbordist = 30.0;
    PVector sum = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.limit(maxforce);
    }
/*
    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }*/
    return sum;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) {
    float neighbordist = 10.0;
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.div(100);
      return steer(sum, false, 1);  // Steer towards the location
    }
    return sum;
  }
}



