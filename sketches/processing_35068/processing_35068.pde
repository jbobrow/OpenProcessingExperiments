
// Boid class
// Methods for Separation, Cohesion, Alignment added
// Based on Daniel Shiffman's The Nature of Code
/*.......................................................................................*/

class Boid {

 PVector loc;       // Boid location
 PVector vel;       // Boid velocity
 PVector acc;       // Boid acceleration
 float r;           // Boid radius
 PVector[] hist;    // History path
 int counter = 0;   // Counter history path


  //Boid Render
  float sc=3; //scale factor for the render of the boid
  float flap = 0;
  float t=0;

    Boid (PVector l){
    acc = new PVector(0,0,0);
    vel = new PVector(random(-1,1),random(-1,1),random(-1,1));
    loc = l.get();
    r = 3.0;
    hist = new PVector[2000]; //1000


  }

  void run(ArrayList boids){
    flock(boids);
    update();
    borders();
    render();
    //t+=.1;   // for wings
    //flap = 10*sin(t);///

  }
  


  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(wSep);
    ali.mult(wAli);
    coh.mult(wCoh);
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
    vel.limit(ms);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
    
    // save location every 10 frames
    if (frameCount % 10 == 0 && counter < hist.length) {
      hist[counter] = loc.get();
      counter++;
    }
  }

  void seek(PVector target) {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }


  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    
//    strokeWeight(2); //Shows traget vector
//    stroke(#329555);
//    line(target.x,target.y,target.z,loc.x,loc.y,loc.z);
    
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(ms*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(ms);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(mf);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0,0);
    }
    return steer;
  }

  void render() {

      pushMatrix();
      translate(loc.x,loc.y,loc.z);
      strokeWeight(2);
      stroke(0);
      point(0,0,0);
      popMatrix();
    
      
    // draw history path
    

    strokeWeight(0.3);
    beginShape();
    for (int i=0; i<counter; i++) {
      stroke(#000033, 10);
      vertex(hist[i].x,hist[i].y,hist[i].z);
    }
    if (counter > 0) vertex(loc.x, loc.y, loc.z);
    endShape();
  
  
//    pushMatrix();
//    translate(loc.x,loc.y,loc.z);
//    rotateY(atan2(-vel.z,vel.x));
//    rotateZ(asin(vel.y/vel.mag()));
//    strokeWeight(0.6); 
//    //draw bird
//    beginShape(TRIANGLES);
//    vertex(3*sc,0,0);
//    vertex(-3*sc,2*sc,0);
//    vertex(-3*sc,-2*sc,0);
//     
//    vertex(3*sc,0,0);
//    vertex(-3*sc,2*sc,0);
//    vertex(-3*sc,0,2*sc);
//     
//    vertex(3*sc,0,0);
//    vertex(-3*sc,0,2*sc);
//    vertex(-3*sc,-2*sc,0);
//     
////    // wings
////    vertex(2*sc,0,0);
////    vertex(-1*sc,0,0);
////    vertex(-1*sc,-8*sc,flap);
////     
////    vertex(2*sc,0,0);
////    vertex(-1*sc,0,0);
////    vertex(-1*sc,8*sc,flap);
////    //
//     
//    vertex(-3*sc,0,2*sc);
//    vertex(-3*sc,2*sc,0);
//    vertex(-3*sc,-2*sc,0);
//    endShape();
//    //box(10);
//    popMatrix();
  }


  // Bounding Box
  void borders() {
    if (loc.x < 0 && vel.x < 0) vel.x *= -1;
    if (loc.y < 0 && vel.y < 0 ) vel.y *= -1;
    if (loc.z < 0 && vel.z < 0) vel.z *= -1;
    if (loc.x > HOR && vel.x < HOR) vel.x *= -1;
    if (loc.y > VER && vel.y < VER) vel.y *= -1;
    if (loc.z > ZED && vel.z < ZED) vel.z *= -1;
  }

//  // Wraparound
//  void borders() {
//    if (loc.x < -r) loc.x = HOR+r;
//    if (loc.y < -r) loc.y = VER+r;
//    if (loc.z < -r) loc.z = ZED+r;
//    if (loc.x > HOR+r) loc.x = -r;
//    if (loc.y > VER+r) loc.y = -r;
//    if (loc.z > ZED+r) loc.z = -r;
//  }
  
/////Repeller Stuff
   void applyForce(PVector force) {
    float mass = 1; // We aren't bothering with mass here
    force.div(mass);
    acc.add(force);
    } 
/////End of Repeller Stuff

    // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < dSep)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
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
      steer.mult(ms);
      steer.sub(vel);
      steer.limit(mf);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) {
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < nghbdst)) {
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
      steer.mult(ms);
      steer.sub(vel);
      steer.limit(mf);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) {
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < nghbdst)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum,false);  // Steer towards the location
    }
    return sum;
  }
}

