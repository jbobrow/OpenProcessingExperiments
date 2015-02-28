

class Agent {

  PVector loc, vel, acc; 
  float r; 

  //we can try to do without these! 
  float maxForce, maxSpeed; 
  float neighbordist = 50.0;
  ArrayList boids; 

  Agent (PVector loc, float maxSpeed, float maxForce, ArrayList boids) {
    acc = new PVector(0, 0); 
    vel = new PVector( random(-50, 50), random(-50, 50)); 
    this.loc = loc; 
    r = 3.0; 
    this.boids = boids; 
    this.maxSpeed = maxSpeed; 
    this.maxForce = maxForce;
  } 

  void run( ) {
    flock();  //update acceleration
    update(); //update velocity and location
    borders(); //fix the borders 
    render(); //draw the birds 
    maxSpeed += x/1500;// the sound affects the speed of fishes
    if (maxSpeed<=0) {
      maxSpeed = 3 ;
    }
    //println(maxSpeed);
  }

  void flock( ) {
    PVector separate = new PVector(0, 0);
    PVector align = new PVector(0, 0); 
    PVector cohere = new PVector(0, 0);  
    adjustHeading( separate, align, cohere); 

    separate.mult(1.5); 
    align.mult(0.5); 
    cohere.mult(1.0); 

    acc.add(separate); 
    acc.add(align); 
    acc.add(cohere);
  }


  void update() {
    // Update velocity
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
  }


  void adjustHeading(PVector separate, PVector align, PVector cohesion) {
    PVector sum = new PVector( 0, 0); 
    int countSep, countAlign, countCohes; 
    countSep = countAlign = countCohes = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Agent other = (Agent) boids.get(i);
      float d = PVector.dist(loc, other.loc) +x;// it leads to the fish dance
      countSep = separation_rule( separate, other, d, countSep); 
      countAlign = alignment_rule( align, other, d, countSep); 
      countCohes = cohesion_rule( sum, other, d, countCohes );
    }

    //average each vector 
    averageVector( separate, countSep); 
    averageVector( align, countAlign); 
    averageVector( cohesion, countCohes); 


    steeringEquation( separate ); 
    steeringEquation( align ); 

    if (countCohes > 0) {
      cohesion = steer( sum );  // Steer towards the location
    } //if
  }


  int separation_rule( PVector steer, Agent other, float d, int count) {
    float desiredseparation = 25.0f;
    // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
    if ((d > 0) && (d < desiredseparation)) {
      // Calculate vector pointing away from neighbor
      PVector diff = PVector.sub(loc, other.loc);
      diff.normalize();
      diff.div(d);        // Weight by distance
      steer.add(diff);
      count++;            // Keep track of how many
    }
    return count;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity 
  int alignment_rule( PVector steer, Agent other, float d, int count) {

    if ((d > 0) && (d < neighbordist)) {
      steer.add(other.vel);
      count++;
    }
    return count;
  } //align( ) 

  int cohesion_rule( PVector steer, Agent other, float d, int count) { 
    if ((d > 0) && (d < neighbordist)) {
      steer.add(other.loc); // Add location
      count++;
    }
    return count;
  } //cohesion 


  void averageVector (PVector steer, int count) { 
    if (count > 0) steer.div((float)count);
  } //averageVector 


  //Steering = Desired - Velocity
  void steeringEquation( PVector steer) {
    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      steer.normalize(); //make it a unit vector
      steer.mult(maxSpeed); //scale based on the max speed
      //THIS IS THE KEY 
      steer.sub(vel); //Steering = Desired - Velocity 
      steer.limit(maxForce); //limit based on the maximum force
    } //if
  } //steering equation



  // A method that calculates a steering vector towards a target
  PVector steer(PVector target ) {
    PVector steer;  // The steering vector
    // Use vector subtraction to obtain a vector from the location to the target
    PVector desired = PVector.sub(target, loc);  
    // Compute the distance from the target -- ie., the magnitude of the vector    
    steeringEquation( desired); 
    return desired;
  }



  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }


  void render() {
    // Draw fishes
    float theta = vel.heading2D() + radians(90);
    fill(r, g, b, 95);
    stroke(50);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    beginShape( );
    vertex(0, -r*2);
    vertex(-r, r);
    vertex(0, r*5);
    vertex(-r, r*6);
    vertex(r, r*6);
    vertex(0, r*5);
    vertex(r, r);
    endShape();
    popMatrix();
  }
} //Agent 


