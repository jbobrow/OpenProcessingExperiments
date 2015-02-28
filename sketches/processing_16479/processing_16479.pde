
// Most of the code except the obstacle avoid function was copied from
// Daniel Shiffman's <http://www.shiffman.net> The Nature of Code, 
// Steering Wander example
// This examples where the inspiration for this project

// The "Boid" class (for wandering)
class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float wandertheta;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float checkL;       // check factor of the avoidance rectangle

  Boid(PVector l, float ms, float mf) {
    acc = new PVector(0,0);
    vel = new PVector(random(2,3),random(2,3));
    loc = l.get();
    r = 5.0;
    wandertheta = 0.0;
    maxspeed = ms;
    maxforce = mf;
    checkL = 30;
  }
  
  void run() {
    update();
    borders();
    render();
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
  
  //////////////////////////////////////////
  void obstacleAvoid() {
    
    boolean projected = false;
    float checkLength = checkL*vel.mag();
    PVector forward,ray,projection,force,lateral;
    float dotProd,dis;
    forward = vel.get();
    forward.normalize();
    ray = forward.get();
    ray.mult(checkLength);
    lateral = forward.get();
    lateral.set(lateral.y,-lateral.x,0);
    lateral.mult(r);

    ArrayList p = new ArrayList();
    p.add(new PVector(lateral.x,lateral.y));
    p.add(new PVector(-lateral.x,-lateral.y));
    p.add(new PVector(ray.x-lateral.x,ray.y-lateral.y));
    p.add(new PVector(ray.x+lateral.x,ray.y+lateral.y));
    Poly check = new Poly(loc.x,loc.y,p);
    
    for ( int i = 0; i < obs.size(); i++ ) {
      Poly ob = (Poly)obs.get(i);
      projection = overlap(check,ob);
      if ( (projection.x != 0) || (projection.y != 0) ) { //overlapping so steer away
        projected = true;
        projection.normalize();
        force = lateral.get();
        force.normalize();
        force.mult( projection.dot(force) );
        force.limit(maxforce);
        acc.add(force);
      }
    }
    if ( projected == false ) { //if there is no objects to steer around, wander
      wander();
    }
    
    // Render wandering circle, etc. 
    if (debug) { 
      check.show(); //show the checking rectangle
    }
    
  }  
  
  /////////////////////////////////////////////////////
  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + radians(90);
    fill(0,255,255);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    
    beginShape(TRIANGLES);
    
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    
    //ellipse(0,0,2*r,2*r);
    popMatrix();
  }
  
  /////////////////////////////////////////////////
  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
  
  /////////////////////////////////////////////////
  void wander() {
    float wanderR = 16.0f;         // Radius for our "wander circle"
    float wanderD = 50.0f;         // Distance for our "wander circle"
    float change = 0.3f;//0.25f;
    wandertheta += random(-change,change);     // Randomly change wander theta
  
    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = vel.get();  // Start with velocity
    circleloc.normalize();            // Normalize to get heading
    circleloc.mult(wanderD);          // Multiply by distance
    circleloc.add(loc);               // Make it relative to boid's location
    
    PVector circleOffSet = new PVector(wanderR*cos(wandertheta),wanderR*sin(wandertheta));
    PVector target = PVector.add(circleloc,circleOffSet);
    
    acc.add(steer(target,false));  // Steer towards it
    
  }  
  
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      //steer.add(new PVector(0,1f)); //pull down
      steer.limit(maxforce);  // Limit to maximum steering force
      
    } else {
      steer = new PVector(0,0);
    }
    return steer;
  }

}



