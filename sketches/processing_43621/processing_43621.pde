
// Project 2
// ARCH 4050
// Josh Grant
// Bradley Walkup
// Code from Daniel Shiffman's "Flocking" as stated below
// Sketch abstracts the painting Starry Night
// into a new composition based upon flocking

//------- CITATION------------//

// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

//-------- Begin Code ---------//

Flock flock;
PImage img; //stary night
int x=0; // used for xposition for boid's
int y=0; // used for yposition for boid's


void setup() {
  size(600, 494); //sketch size based upon image
  img=loadImage("starryNight.jpg"); //Starry Night by Van Gogh
  background(img); //Draws the image to start the sketch

  flock = new Flock();

  // Add an initial set of boids into the system
  for (int i = 0; i < 100; i++) {
    flock.addBoid(new Boid(new PVector(width/2, height/2), 3, .05)); //sets variables 3 is speed of boids
  }
  smooth();
}

void draw() {
  fill(0, 5); //black rectangle drawn with transparency to cover the image and create trails
  rect(0, 0, width, height); //rectangle
  flock.run(); //draws the flock
}

// Add a new boid into the System when mouse is pressed 
void mousePressed() {
  flock.addBoid(new Boid(new PVector(mouseX, mouseY), 2.0, 0.05f)); //same code as above for the new boid
}


//--------------------------------------------------//

// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

//-------------------------------------------------//

// Boid class
// Methods for Separation, Cohesion, Alignment added


class Boid {

  PVector loc; //location
  PVector vel; //velocity
  PVector acc; //acceleration
  int r; //size of circles
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed



    Boid(PVector l, float ms, float mf) { //3 variables that are set above in the boid
    acc = new PVector(0, 0);
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc = l.get();
    r = 5; //size of circles
    maxspeed = ms;
    maxforce = mf;
  }

  void run(ArrayList boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  // New acceleration each time based on three rules
  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5); //space between the ellipse keeping them apart
    ali.mult(1); //alignment of the ellipse (greater the number smaller the range and stuck in center)
    coh.mult(1); //Cohesion (tightness) [calculates average location of boids to steer in that direction] of the group [number 2 has neat effects]
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
    acc.mult(.5); //multiplies the pVector [can achieve a swarming look]
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
    PVector desired = PVector.sub(target, loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired, vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0, 0);
    }
    return steer;
  }


//------------------ RENDER OF ELLIPSES -----------------------//


  void render() {
    // Draw a ellipse rotated in the direction of velocity
    float theta = vel.heading2D() + radians(90);

    int a = int(random(0, img.width)); //obtain color data from the image
    int b = int(random(0, img.height)); //obtain color date from the image
    color myColor = img.get(a, b); //get the color
    fill(myColor); //fill ellipse with the color

      noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);

    ellipse(x, y, r, r*5); //this will draw circles
    popMatrix();
  }
//--------------------------------------------------------------//

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
    float desiredseparation = 30.0f; //this controls the group of boids size
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




  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) {
    float neighbordist = 50.0; //lower number slower
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
    float neighbordist = 150.0;
    PVector sum = new PVector(0, 0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
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


//--------------------------------------------//

// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

//--------------------------------------------//

// Flock class
// Does very little, simply manages the ArrayList of all the boids

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


