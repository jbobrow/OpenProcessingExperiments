

PImage tree; //Setting up an image variabel called tree


void setup() {
  size(800, 500);  //size of the pic must be the same as the size of the screen
  tree = loadImage("tree.png");
 flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    flock.addLeaf(new Leaf(width/2, height/2));
  }
}

void draw() {
  background(255);
  image(tree, 0, 0);
 flock.run();
}

// Add a new boid into the System
void mousePressed() {
 flock.addLeaf(new Leaf(mouseX, mouseY));
}


//Creats a class of objects <Leaf>

class Leaf {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;            //radius
  float forceStrength;    // steering force
  float maxspeed;    // Maximum speed
  float ellipseSize; // Leaf size
  color c;  // colors of the leafs
  float noiseScale = 80;
  float noiseStrength = 1;

  // class constructor and sets values

  Leaf(float x, float y) {
    acceleration = new PVector(0, 0);
    ellipseSize = random (4, 15); //id upload pic, change here

    float angle = random(TWO_PI); // direction
    velocity = new PVector(cos(angle), sin(angle));

    //location = new PVector(x, y); //the leafs movement stars from the middle

      location = new PVector (random (width), random (height)); // leafs are spred out on the screen
    maxspeed = 2;
    forceStrength = random (0.1, 0.2);
    setColor();
  }

  void setColor () {
    int colorDice = (int) random (3);

    if (colorDice == 0) c = #ff9758;
    else if (colorDice == 1) c = #916a8e;
    else c = #939758;
  }
  
  void run(ArrayList<Leaf> leafs) {
    flock(leafs);
    update();
    borders();
    display();
  }


  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules

  void flock(ArrayList<Leaf> leafs) {

    PVector separationSum = new PVector (0, 0);
    float separationCount = 0;
    float speedSum = 0;
    
    PVector alignSum = new PVector (0,0);
    float alighCount = 0;
    
    PVector cohesionSum = new PVector (0, 0);
    float cohesionCount = 0;
    
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
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
    steer.limit(forceStrength);  // Limit to maximum steering force
    return steer;
  }


  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Leaf> leafs) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Leaf other : leafs) {
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
      steer.limit(forceStrength);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Leaf> leafs) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Leaf other : leafs) {
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
      steer.limit(forceStrength);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // COHISION inheret qualities of near by objects 
  
  PVector cohesion (ArrayList<Leaf> leafs) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Leaf other : leafs) {
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
  
  
  // CHECK-CHECK_CHECK


  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  void checkEdgesAndBounce () {

    if (location.x < r) {
      location.x = r;
      velocity.x = velocity.x * -1;
    }

    if (location.x > width-r) {
      location.x = width-r;
      velocity.x *= -1;
    }

    if (location.y < r) {
      location.y = r;
      velocity.y *= -1;
    }
    if (location.y > height-r) {
      location.y = height-r;
      velocity.y *= -1;
    }
  }

  void checkEdgesAndRelocate () {

    if (location.x < -r) {
      location.x = random (-r, width+r);
      location.y = random (-r, height+r);
    }
    if (location.x > width+r) {
      location.x = random (-r, width+r);
      location.y = random (-r, height+r);
    }
    if (location.y < -r) {
      location.x = random (-r, width+r);
      location.y = random (-r, height+r);
    }
    if (location.y > height + r) {
      location.x = random (-r, width+r);
      location.y = random (-r, height+r);
    }
  }
  
// DISPLAY EVERYTHING

    void display() {
    //Draw leafs, upload pictures here
    fill(c);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
    popMatrix();
  }

}



