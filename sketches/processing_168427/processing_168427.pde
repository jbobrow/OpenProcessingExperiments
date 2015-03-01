
Flock flock;
Human human;

void setup() {
  size(640, 360);
  flock = new Flock();
  human = new Human();
  // Add an initial set of boids into the system
  for (int i = 0; i < 2; i++) {
    flock.addBoid(new Boid(random(1,5),width/2,height/2));
  }
}

void draw() {
  background(50);
  flock.run();
  human.prime();
  human.display();
 
  
}

// Add a new boid intom
void mousePressed() {
  flock.addBoid(new Boid(random(1,5),mouseX,mouseY));
}



class Human {
  color c1;
  float bigness;
  float topSpeed;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  

  Human() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topSpeed = 5.0;
    
  }

  
  void prime() {
   c1 = color(204, 153, 0);
   PVector mouse = new PVector(mouseX,mouseY);
   PVector acceleration = PVector.sub(mouse,location);
   bigness = 1;
    
    acceleration.normalize();
    acceleration.mult(0.5);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topSpeed);
    // Location changes by velocity
    location.add(velocity);
    
    if (location.x == mouseX || location.y == mouseY) {
     velocity.x = 0;
     velocity.y = 0;
    }
    
    
  }
  
  void display() {
    fill(c1);
    strokeWeight(3);
    stroke(0);
    ellipse(location.x,location.y,bigness*50,bigness*50);
    
    ellipse(location.x-(bigness*3),location.y-(bigness*4),bigness*10,bigness*10);
    ellipse(location.x-(bigness*20),location.y-(bigness*4),bigness*10,bigness*10);

    
    
  }
  
  
  
  
}

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PVector wind;
  
  float mass;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float scalar;

    //constructor
    Boid(float m, float x, float y) {
    
    //wind force  
    mass = m;
    wind = new PVector(.1,0);
    
    acceleration = new PVector(0, 0);

    // This is a new PVector method not yet implemented in JS
    // velocity = PVector.random2D();

    // Leaving the code temporarily this way so that this example runs in JS
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    mass = (random(1,10));
    scalar = .05;
    maxspeed = 2;
    maxforce = 0.05;
  }

  //The object?
  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
    PVector wind = new PVector (0.05,0);
    applyForce(wind); //apply force vector, use wind to affect the vector
  }

  void applyForce(PVector force) {
   
    PVector f = PVector.div(force,mass); // newtons second law added to the sketch
    acceleration.add(f);
    
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    
    //PVector mouse = new PVector (mouseX, mouseY);
    //PVector dir = PVector.sub(mouse,location);
    
    PVector wind = new PVector(0.01,0);
 
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    PVector pro = proximity(boids);
    //PVector win = wind(boids);
    //acceleration.normalize();
    //acceleration.mult(scalar);
    //acceleration = dir;
    
    // Arbitrarily weight these forces
    sep.mult(0);
    ali.mult(0);
    coh.mult(0);
    pro.mult(8); //mouse weight
    //win.mult(.5);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(pro); //mouse vector
    //applyForce(win);
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
    float theta = velocity.heading2D() + radians(90);
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    
    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -mass*2);
    vertex(-mass, mass*2);
    vertex(mass, mass*2);
    endShape();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -mass) location.x = width+mass;
    if (location.y < -mass) location.y = height+mass;
    if (location.x > width+mass) location.x = -mass;
    if (location.y > height+mass) location.y = -mass;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
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
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // sum.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }
  
  // Mouse steering
  // For every nearby boid in the system, calculate the average distance from the mouse
  PVector proximity (ArrayList<Boid> boids) {
    float scalar = .5;
    float neighbordist = 100; // proximity to mouse required for activation. 
    
    //PVector sum = new PVector(0, 0);
    PVector mouse = new PVector(mouseX,mouseY); //calculate mouse location
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, mouse); //store distance between mouse and a boid
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
      PVector steer = PVector.sub(mouse, location); //calculate difference between mouse and boid location, create new vector
      steer.limit(maxforce);
      return steer; //return the new vector for use
    } 
    else {
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
    } 
    else {
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


