
// Methods for Separation, Cohesion, Alignment added

class Agent {
  //something that moves and can change direction in a graduated fashion
  Vec3D loc, vel, acc;

  float new_Agent;
  //is linked back to the physical world with mass
  float mass;

  //From Shiffman's flocking example
  float maxforce;
  float maxspeed;

  float neighborDist;
  float desiredSeparation;

  Agent (Vec3D temploc, Vec3D tempvel, float ms, float mf, float nd, float sep) {
    loc = temploc;
    vel = tempvel;
    acc = new Vec3D();
    mass=100;

    maxspeed = ms;
    maxforce = mf;
    neighborDist=nd*nd;
    desiredSeparation=sep;
  }

  void run() {
    checkEdges();
    display();
    //volBrushLocation();
    //trace();
    flock(pop);
    //gotoPoint();
    //follow curve create from threading through boxes
    //followPath();
    update();
  }

  // Method to update location
  void update() {
    acc.limit(aAccel);
    // Update velocity
    vel.addSelf(acc);
    // Limit speed
    vel.limit(maxSpeed);
    loc.addSelf(vel);
    // Reset accelertion to 0 each cycle
    acc.clear();
  }





  void gotoPoint() {
  
        //find the vector path to goalloc
        Vec3D diff = target.sub(loc.copy());

        //get the vector magnitude in order to scale attraction force
        float d = diff.magnitude();
        //pass vector and scalar to attraction function
        attract(diff.copy(), d); //attract to neighbour
        //switch off behaviour, so only happens once until condition met
 
        if (d > boxS) {
          move = false;
        }
        
        else

        //test distance
       
        if (d<10) {
          move = true; //avoid neighbour
          println("move");
        }
        
      }
    

  void attract (Vec3D v, float d) {
    acc.interpolateToSelf(v, (aAttract/d));
  }

  void align(Vec3D v, float d) {
    acc.interpolateToSelf(v, aAlign);
  }


  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList pop) {
    Vec3D sep = separate(pop);   // Separation
    Vec3D ali = align(pop);      // Alignment
    Vec3D coh = cohesion(pop);   // Cohesion
    // Arbitrarily weight these forces
    sep.scaleSelf(1.5);
    ali.scaleSelf(1.0);
    coh.scaleSelf(1.0);
    // Add the force vectors to acceleration
    acc.addSelf(sep);
    acc.addSelf(ali);
    acc.addSelf(coh);
  }

  void display() {
    stroke(0);
    strokeWeight(5);
    point(loc.x, loc.y, loc.z);
  }



  void seek(Vec3D target) {
    acc.addSelf(steer(target, false));
  }

  void arrive(Vec3D target) {
    acc.addSelf(steer(target, true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  Vec3D steer(Vec3D target, boolean slowdown) {
    Vec3D steer;  // The steering vector
    Vec3D desired = target.sub(loc);  // A vector pointing from the location to the target
    float d = desired.magnitude(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.scaleSelf(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.scaleSelf(maxspeed);
      // Steering = Desired minus Velocity
      steer = desired.sub(vel).limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new Vec3D();
    }
    return steer;
  }


  // Separation
  // Method checks for nearby boids and steers away
  Vec3D separate (ArrayList pop) {
    Vec3D steer = new Vec3D();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = pop.size()-1 ; i >= 0 ; i--) {
      Agent other = (Agent) pop.get(i);
      if (this != other) {
        float d = loc.distanceTo(other.loc);
        // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
        if (d < desiredSeparation) {
          // Calculate vector pointing away from neighbor
          Vec3D diff = loc.sub(other.loc);
          diff.normalizeTo(1.0/d);
          steer.addSelf(diff);
          count++;
        }
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    // As long as the vector is greater than 0
    if (steer.magSquared() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalizeTo(maxspeed);
      steer.subSelf(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  Vec3D align (ArrayList pop) {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = pop.size()-1 ; i >= 0 ; i--) {
      Agent other = (Agent) pop.get(i);
      if (this != other) {
        if (loc.distanceToSquared(other.loc) < neighborDist) {
          steer.addSelf(other.vel);
          count++;
        }
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }

    // As long as the vector is greater than 0
    if (steer.magSquared() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalizeTo(maxspeed);
      steer.subSelf(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  Vec3D cohesion (ArrayList pop) {
    Vec3D sum = new Vec3D();   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = pop.size()-1 ; i >= 0 ; i--) {
      Agent other = (Agent) pop.get(i);
      if (this != other) {
        if (loc.distanceToSquared(other.loc) < neighborDist) {
          sum.addSelf(other.loc); // Add location
          count++;
        }
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
      return steer(sum, false);  // Steer towards the location
    }
    return sum;
  }
 


  void checkEdges() {
    boolean changed=false;
    if (loc.x>DX - 498) {
        vel.x=vel.x*-1;
    }
    else if (loc.x< -498) {
        vel.x=vel.x*-1;
      
    }
    if (loc.y>DY - 498) {
      if (vel.y>0) {
        vel.y=vel.y*-1;
       ;
      }
    }
    else if (loc.y< -498) {
        vel.y=vel.y*-1;
     
    }

    if (loc.z>DZ-498) {
        vel.z=vel.z*-1;
    
    }
    else if (loc.z<-498) {
        vel.z=vel.z*-1;
    
    }
  
  }

 
}//-----------------------------------------------------end class


