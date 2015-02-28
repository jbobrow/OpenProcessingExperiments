
// Flocking
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

// Boid class
// Methods for Separation, Cohesion, Alignment added

class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  PVector avd;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;  // Maximum speed
  int life =255*3;
  int born=0;
  int kleur;

    Boid(PVector l, PVector d, float ms, float mf, int kl) {
    acc = new PVector(0,0);
    vel = d.get(); //random(-1,1),random(-1,1));
    loc = l.get();
    r = 2.0;
    maxspeed = ms;
    maxforce = mf;
    kleur = kl;
  }

  void run(ArrayList boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);    // Cohesion
    PVector avd = avoid(boids);   //avoid walls

    // Arbitrarily weight these forces
    sep.mult(1.8);
    ali.mult(1.0);
    coh.mult(1.0);
    avd.mult(1.2);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
    acc.add(avd);
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
    maxforce += 0.0001;
  }

  void seek(PVector target) {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }
  
  //to avoid obstacles
  
  PVector avoid (ArrayList boids) {
    //seperation from the wall
    float desiredseparation = 250;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close to the edge
  
    if (loc.x < desiredseparation )//|| loc.y < desiredseparation)
    {
        PVector diff = new PVector(loc.x,0);
        diff.normalize();
        steer.add(diff);
        count++;
       
      } else if(loc.y < desiredseparation )//
      {
      PVector diff = new PVector(0,loc.y);
        diff.normalize();
       count++;
        steer.add(diff);
      } else if(loc.x > width - desiredseparation)// || 
     {
      PVector diff = new PVector(-width-loc.x,0);
        diff.normalize();
  count++;
        steer.add(diff);
        } else if(loc.y > height - desiredseparation)
        {
           PVector diff = new PVector(0,-height-loc.y);
        diff.normalize();
       count++;
        steer.add(diff);
        }

    // Average -- divide by how many
   

    // As long as the vector is greater than 0
   if (count > 0)
   {
     steer.div(count);
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
   }
   
    return steer;
  }
  


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
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    //float theta = vel.heading2D() + radians(90);
    fill(kleur,0,255-kleur,int(life/6));
    //fill(life/3+5);
   // maxspeed = life/150+2;
   
  
     if (life<0)
    {
     flock.kill=true; 
 
    }
    
      // life --;
        stroke(0,0);
    pushMatrix();
    translate(loc.x,loc.y);
   // rotate(theta);
    //beginShape(TRIANGLES);
    //vertex(0, -r*4);
    //vertex(-r, r*4);
    //vertex(r, r*4);
    //endShape();
    rect(-10,-10,20,20);
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
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    int klr=0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;  // Keep track of how many

      //mixing color
     
              if(abs(kleur-klr)>10)
              {
            //    born--;
              }
       klr = klr + other.kleur;
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
     // flock.babykleur = (klr+kleur) / (count+1);
    } 
      if (count == 4)
       {
         if(klr > 260 && klr < 780)
         {
          kleur = 255; 
         } else
         {
          kleur = 0; 
         }
         
   //  flock.birth = true;
     //  flock.addBoid(new Boid(loc,vel,maxspeed*3,maxforce,255));
    // born++;
    // if (born >120)
    // {
   //  println("BIRTH");
   //  flock.birth = true;
   //  born = 0;
     }
     
  // if (count > 5 && life < 600)
  //     {
  //   flock.kill = true;
     //  flock.addBoid(new Boid(loc,vel,maxspeed*3,maxforce,255));
  //      }
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
    float neighbordist = 70.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
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
    float neighbordist = 4.0;
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < neighbordist)) {
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


