
// The Boid class

class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float minspeed;    // Minimum speed

    color c = color(200, 125);

  Weapon[] weapons;
  Defence[] defences;

  boolean selected = false;
  boolean mouseOver = false;

  float targetingRange = 100; 
  float lockedRange = 100;

  float health = 100;
  float sepDist = 30;    //desired separation distance (orbiting target etc?)

  float reloadTime = 100; //in frames, should make it in TIME!
  float turretDamage = 10; 
  float turretRange = 100;

  float turretTimer = 0;
  float lockTimer = 0;

  boolean hasTarget = false;
  boolean targetLocked = false;
  boolean beingTargeted = false; //not yet implemented

  String order = null;

  Boid target = null;
  ArrayList posse = new ArrayList();  //not yet implemented
  int kills = 0;

  ///////////////////////////////////////////////////////////////n

  Boid(PVector l, float ms, float mf) {
    acc = new PVector(0, 0);
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc = l.get();
    r = 2.0;
    maxspeed = ms;
    maxforce = mf;
    minspeed = 0.005;
  }

  //initiate a boid with a specific starting velocity
  Boid(PVector l, PVector v, float ms, float mf) {
    acc = new PVector(0, 0);
    vel = v.get();
    loc = l.get();
    r = 2.0;
    maxspeed = ms;
    maxforce = mf;
    minspeed = 0.005;
  }

  void run(ArrayList boids, ArrayList targetBoids) {
    // if (order == null) {
    if (!hasTarget) {
      flock(boids);
    }
    else {
      followTarget();
    }
    //}
    acquireTarget(targetBoids);

    update();
    borders();

    render();
    if (selected) renderVisibilityAngle();
    if (mouseOver) renderMouseOver();

    //mouseOver = false;

    tickTimers();
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

  void followTarget() {

    acc.add(steer(target.loc, false));
    //PVector sep = separateTarget(target);
    //sep.mult(1.5);
    //acc.add(sep);

    fireAtTarget();
  }

  void acquireTarget(ArrayList targetBoids) {

    if (!hasTarget) {
      for (int i = 0; i < targetBoids.size(); i++) {
        target = (Boid) targetBoids.get(i);
        PVector D = PVector.sub(this.loc, target.loc);
        float dM = D.mag();

        //float angle = PVector.angleBetween(this.vel, target.vel) * 360/PI;
        //println("ANGLE: " + angle);

        //if (dM < targetingRange && angle < 10) {
        if (dM < targetingRange) {
          hasTarget = true;          
          return;
        }
      }
    } 
    else {
      //show targetting
      noStroke();
      fill(c, 10);
      ellipse(target.loc.x, target.loc.y, 20, 20);
    }
  }

  void looseTarget() {
    targetLocked = false;
    hasTarget = false;
  }

  void setTarget(Boid _t) {
    target = _t;
  }

  void fireAtTarget() {
    stroke(255, 10);
    line(this.loc.x, this.loc.y, target.loc.x, target.loc.y);
    if (turretTimer == 0 && hasTarget) {
      turretTimer = reloadTime;
      stroke(255);
      line(this.loc.x, this.loc.y, target.loc.x, target.loc.y);
      target.setHealth(target.health - turretDamage);
    }

    if (target.isDead()) {
      looseTarget();
    }
  }

  void renderVisibilityAngle() {
    float tr = targetingRange;

    pushMatrix();
    beginShape();
    translate(loc.x, loc.y);
    rotate(vel.heading2D());

    fill(255, 20);
    stroke(255, 40);
    vertex(r, 0);

    fill(255, 0);
    stroke(255, 0);
    vertex(vel.x+targetingRange/2, vel.y+10);

    //stroke(255,10);
    //arc(0, 0, tr, tr, -PI/6, PI/6);

    //stroke(255,10);
    vertex(vel.x+targetingRange/2, vel.y-10);

    fill(255, 20);
    stroke(255, 40);
    vertex(r, 0);

    endShape();
    popMatrix();

    //targetingRange
    fill(c, 15);
    stroke(c, 20);
    ellipse(loc.x, loc.y, targetingRange*2, targetingRange*2);

    //health
    fill(255, 10);
    ellipse(loc.x, loc.y, health/targetingRange*100, health/targetingRange*100);
  }

  private void renderMouseOver() {
    rectMode(CENTER);
    stroke(255, 30);
    fill(c, 20);
    rect(loc.x, loc.y, r*10, r*10);
  }

  void setHealth(float h) {
    health =  h;
  }

  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target, false));
  }

  void arrive(PVector target) {
    acc.add(steer(target, true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target, loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = target.sub(desired, vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0, 0);
    }
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PI/2;
    fill(c, 100);
    stroke(c);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
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
    float desiredseparation = 20.0;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
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

  // Separation from Target
  // Method checks for target boid and steers away
  PVector separateTarget (Boid target) {
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // Check if target is too close

    float d = PVector.dist(loc, target.loc);
    // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
    if ((d > 0) && (d < sepDist)) {
      // Calculate vector pointing away from neighbor
      //PVector diff = PVector.sub(loc, target.loc);
      PVector diff = PVector.sub(loc, target.loc);
      diff.mult(0.5);
      diff.normalize();
      diff.div(d);        // Weight by distance
      steer.add(diff);
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
    float neighbordist = 25.0;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
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
    float neighbordist = 25.0;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
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

  void setColor(color _c) {
    c = _c;
  }

  boolean isDead() {
    return (health < 1? true : false);
  }

  void tickTimers() {
    if (turretTimer > 0) turretTimer--;
  }
}


