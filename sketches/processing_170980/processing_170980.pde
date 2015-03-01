


Flock flock;

void setup() {
  size(1200, 700);
  flock = new Flock();


  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
}

void draw() {
  background(50);
  if (millis() < 5000) {
    flock.run();
  } else if (millis() > 5000 && millis() < 10000) {
    setup();
    flock.run2();
  } else if (millis() > 10000 && millis() < 15000) {
    setup();
    flock.run3();
  } else if (millis() > 15000 && millis() < 20000) {
    setup();
    flock.run4();
  } else if (millis() > 20000 && millis() < 25000) {
    setup();
    flock.run();
  } else if (millis() > 25000 && millis() < 30000) {
    setup();
    flock.run4();
    flock.run5();
  } else if (millis() > 30000 && millis() < 35000) {
    setup();
    flock.run6();
  }
}



// The Boid class

class Boid {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    Boid(float x, float y) {
    acceleration = new PVector(0, 0);

    // This is a new PVector method not yet implemented in JS
    // velocity = PVector.random2D();

    // Leaving the code temporarily this way so that this example runs in JS
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    r = 50.0;
    maxspeed = 2;
    maxforce = 0.03;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    render();
  }


  void run2(ArrayList<Boid> boids) {
    flock(boids);
    update();
    render2();
    render3();
    render();
  }


  void run3(ArrayList<Boid> boids) {
    flock(boids);
    update();
    render2();
  }

  void run4(ArrayList<Boid> boids) {
    flock(boids);
    update();
    render3();
  }

  void run5(ArrayList<Boid> boids) {
    flock(boids);
    update();
    render4();
  }

  void run6(ArrayList<Boid> boids) {
    flock(boids);
    update();
    render5();
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
    acceleration.mult(.5);
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
    //    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    //

    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r*5, r*4);
    vertex(r*5, -r*4);
    vertex(r*5, r*4);
    vertex(r*5, -r*4);
    endShape();
    popMatrix();
  }

  void render4() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    //    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    //

    fill(0);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r*5, r*5);
    vertex(r*10, -r*5);
    vertex(r*5, r*5);
    vertex(r*10, -r*5);
    vertex(r*5, -r*5);
    vertex(r*10, -r*5);
    vertex(r*5, r*5);
    vertex(r*10, -r*5);
    vertex(r*5, r*5);


    endShape();
    popMatrix();
  }

  void render3() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    //    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    //

    fill(200, 100);
    stroke(100, 100, 100);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r/5, r*4);
    vertex(r/5, -r*4);
    vertex(r/5, r*4);
    vertex(r/5, -r*4);
    endShape();
    popMatrix();
    
     stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r/5, r*8);
    vertex(r/5, -r*8);
    vertex(r/5, r*8);
    vertex(r/5, -r*8);
    endShape();
    popMatrix();
  }

  void render2() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    //    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    //
 
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(location.x/2, location.y/2);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r, r*4);
    vertex(r, -r*4);
    vertex(r, r*4);
    vertex(r, -r*4);
    endShape();
    popMatrix();
 
    stroke(0);
    pushMatrix();
    translate(location.x*1.5, location.y*1.5);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r, r*4);
    vertex(r, -r*4);
    vertex(r, r*4);
    vertex(r, -r*4);
    endShape();
    popMatrix();

  }

  void render5() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    //    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    //

    fill(255);
    stroke(255);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r*5, r*5);
    vertex(r*10, -r*2);
    vertex(r*3, r*5);
    vertex(r*10, -r*2);
    vertex(r*5, -r*5);
    vertex(r*3, -r*2);
    vertex(r*5, r*5);
    vertex(r*10, -r*2);
    vertex(r*3, r*5);
        popMatrix();

  }

  void render6() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    //    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    //

    stroke(0);
    pushMatrix();
    translate(location.x*1.5, location.y*1.5);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(r, r*4);
    vertex(r, -r*4);
    vertex(r, r*4);
    vertex(r, -r*4);
    endShape();
    popMatrix();
  }

  
  
  
  
  
  
  
  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 100.0f;
    PVector steer = new PVector(50, 50, 50);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.mult(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.mult((float)count);
    }

    // As long as the vector is greater than 0

    if (millis () > 8000) {
      if (steer.mag() > 50) {
        // First two lines of code below could be condensed with new PVector setMag() method
        // Not using this method until Processing.js catches up
        // steer.setMag(maxspeed);

        // Implement Reynolds: Steering = Desired - Velocity
        steer.normalize();
        steer.mult(maxspeed);
        steer.sub(velocity);
        steer.limit(maxforce);
      }
    }
    return steer;
  }






  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 500;
    PVector sum = new PVector(0, 0);
    int count = 15;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.sub(other.velocity);
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
    float neighbordist = 500;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.sub(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.mult(count);
      return seek(sum);  // Steer towards the location
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

  void run2() {
    for (Boid b : boids) {
      b.run2(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void run3() {
    for (Boid b : boids) {
      b.run3(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void run4() {
    for (Boid b : boids) {
      b.run4(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void run5() {
    for (Boid b : boids) {
      b.run5(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void run6() {
    for (Boid b : boids) {
      b.run6(boids);  // Passing the entire list of boids to each boid individually
    }
  }


  void addBoid(Boid b) {
    boids.add(b);
  }
}
