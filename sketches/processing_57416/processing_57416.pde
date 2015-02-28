

class Vehicle {

  // All the usual stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float wandertheta;

    // Constructor initialize all values
  Vehicle(float x, float y) {
    location = new PVector(x, y);
    r = 12;
    maxspeed = 3;
    maxforce = 0.2;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    wandertheta = 0;
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // Separation
  // Method checks for nearby vehicles and steers away
  void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }

  void wander() {
    float wanderR = 25;         // Radius for our "wander circle"
    float wanderD = 40;         // Distance for our "wander circle"
    float change = 0.5;
    wandertheta += random(-change,change);     // Randomly change wander theta

    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = velocity.get();    // Start with velocity
    circleloc.normalize();            // Normalize to get heading
    circleloc.mult(wanderD);          // Multiply by distance
    circleloc.add(location);               // Make it relative to boid's location
    
    float h = velocity.heading2D();        // We need to know the heading to offset wandertheta

    PVector circleOffSet = new PVector(wanderR*cos(wandertheta+h),wanderR*sin(wandertheta+h));
    PVector target = PVector.add(circleloc,circleOffSet);
    seek(target);

    // Render wandering circle, etc. 
    //if (debug) drawWanderStuff(location,circleloc,target,wanderR);
  }
 // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

    applyForce(steer);
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

  void display() {
    fill(175);
    pushMatrix();
    translate(location.x, location.y);
    smooth();
    noStroke();
    fill(82, 40, 36);
    ellipse(location.x+20, location.y, 11, 11.5);  //body
    ellipse(location.x+10, location.y, 10, 8);
    ellipse(location.x, location.y, 12, 8);
    ellipse(location.x-13, location.y, 20, 13);
    stroke(82, 40, 36);
    strokeWeight(1);
    line(location.x+12, location.y, location.x+8, location.y-12);  //front legs
    line(location.x+12, location.y, location.x+8, location.y+12);
    line(location.x+8, location.y-12, location.x+20, location.y-8);
    line(location.x+8, location.y+12, location.x+20, location.y+8);
    line(location.x-4, location.y, location.x-8, location.y-12);  //bottom legs
    line(location.x-4, location.y, location.x-8, location.y+12);
    line(location.x-8, location.y+12, location.x-20, location.y+17);
    line(location.x-8, location.y-12, location.x-20, location.y-17);
    line(location.x+2, location.y, location.x+6, location.y-12);  //middle legs
    line(location.x+2, location.y, location.x+6, location.y+12);
    line(location.x+6, location.y-12, location.x-6, location.y-16); 
    line(location.x+6, location.y+12, location.x-6, location.y+16);
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}







