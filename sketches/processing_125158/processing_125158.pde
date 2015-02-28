


Flock flock;



boolean drawNeighborhood = false;
boolean drawAcc = false;
boolean drawVel = false;

int GUICount = 0;
int lastObj = 0;

void setup() {
  size(600,600);
  flock = new Flock(50);
  smooth();
  

}  

void draw() {
  background(255);
  
  int mx = mouseX;
  int my = mouseY;
  //flock.boids.get(0).loc = new PVector(mx,my);
  //flock.boids.get(1).loc = new PVector(width/2,height/2);
  
  flock.run();
}



int nextY(int offset) {
  lastObj+=offset;
  return lastObj;
}
  


// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>

// The "Boid" class

class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  PVector accOld;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    float desiredSeparation = 100.0;

  float neighborDist;
  ArrayList<Boid> neighbors;

  float sepConst, aliConst, cohConst;

  Boid(PVector l, float ms, float mf) {
    acc = new PVector(0, 0);
    accOld = new PVector(0, 0);
    vel = new PVector(0, 0);
    loc = l.get();
    r = 5.0;
    maxspeed = ms = 2.0;
    maxforce = mf= 1.0;
    neighborDist = 150;

    sepConst = 10.0;
    aliConst = 0.5;
    cohConst = 0.5;

    neighbors = new ArrayList<Boid>();
  }


  void run() {

    flock();
    update();
    //borders();
    render();
  }
  void flock() {
    PVector sep = separate();   // Separation
    PVector ali = align();      // Alignment
    PVector coh = cohesion();   // Cohesion
    PVector avd = avoidWalls(); // Borders
    // Arbitrarily weight these forces
    sep.mult(sepConst);
    ali.mult(aliConst);
    coh.mult(cohConst);
    avd.mult(10);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
    acc.add(avd);

    acc.limit(maxforce);

    stroke(255, 0, 0);
    if (drawAcc) line(loc.x, loc.y, loc.x+acc.x*200, loc.y+acc.y*200);
  }
  // Method to update location
  void update() {        
    // lowpass filter
    acc = PVector.add(PVector.mult(acc, 0.9), PVector.mult(accOld, 0.1));

    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    //println(vel);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
    //println(loc);
    accOld = acc.get();
  }

  void addNeighbor(Boid n) {
    neighbors.add(n);
  }

  void setNeighbors(ArrayList<Boid> n) {
    neighbors = new ArrayList<Boid>();
    for (int i=0; i<n.size();i++) {
      neighbors.add(n.get(i));
    }
  }

  PVector cohesion() {
    PVector steer = new PVector(0, 0, 0);
    for (Boid neighbor:neighbors) {
      steer.add(neighbor.loc);
    }
    if (neighbors.size()>0) {
      steer.div(neighbors.size());
      return steer(steer, false);
    }
    return steer;
  }

  PVector align() {
    PVector steer = new PVector(0, 0, 0);
    for (Boid neighbor:neighbors) {
      PVector otherVel = neighbor.vel.get();
      steer.add(otherVel);
    }
    if (neighbors.size()>0) steer.div(neighbors.size());
    if (steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  PVector separate() { //returns desired steering vector
    PVector steer = new PVector(0, 0, 0);
    for (Boid neighbor:neighbors) {
      PVector relative = PVector.sub(loc, neighbor.loc);
      float distance = relative.mag();
      if (distance < desiredSeparation) {
        relative.normalize();

        relative.div(distance); 
        steer.add(relative);
      }
    }
    // raynalds steering = desired - vel
    if (steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  PVector avoidWalls() {
    PVector steer = new PVector(0, 0, 0);

    float desiredOffset = 20;

    if (loc.x < desiredOffset) steer.x = 1;
    if (loc.x > width-desiredOffset) steer.x = -1;
    if (loc.y < desiredOffset) steer.y = 1;
    if (loc.y > height-desiredOffset) steer.y = -1;

    if (steer.mag()>0) {
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

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + radians(90);

    noFill();
    stroke(0);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    ellipse(0, 0, 10, 10);

    if (drawNeighborhood) {
      ellipse(0, 0, neighborDist*2, neighborDist*2);
      //strokeWeight(0.5);
    } 
    if (drawVel) {
      stroke(0, 255, 0);
      line(0, 0, 0, -vel.mag()*12);
    }
    popMatrix();
  }

  // Wraparound
  void borders() {

    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;

    /*
    if (loc.x < -r || loc.x > width+r) vel.x = -vel.x;
     if (loc.y < -r || loc.y > height+r) vel.y = -vel.y;
     */
  }
}

class Flock {
  ArrayList<Boid> boids;
  
  Flock(int n) {
    boids = new ArrayList<Boid>();
    
    for(int i=0; i<n; i++) {
      addBoid(false);
      boids.get(i).vel = new PVector(random(-2.0,2.0),random(-2.0,2.0),0);
    }
  }
  
  void addBoid(boolean atMouse) {
    PVector loc;
    if(atMouse) loc = new PVector(mouseX,mouseY);
    else loc = new PVector(random(width),random(height));
    boids.add(new Boid(loc,100,100));
  }
  
  void removeBoid() {
    boids.remove(boids.size()-1);
  }
  
  void setNeighbors(Boid boid) {
    boid.neighbors = new ArrayList<Boid>();
    for(Boid test:boids) {
      if(boid == test) {
        //println("continue");
        continue;
      }
      
      PVector testLoc = test.loc.get();
      testLoc.sub(boid.loc);
      if(testLoc.mag() < boid.neighborDist) {
        boid.addNeighbor(test);
      }
    }
  }
  
  void run() {
    for(Boid boid:boids) {      
      setNeighbors(boid);      
      //println(boid.neighbors.size());     
      boid.run();
    }
    println();
  }  
}


