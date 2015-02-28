
// Seek_Arrive was made by // Daniel Shiffman <http://www.shiffman.net>
// aaron albin has modified this boid file.
// The "Boid" class

// 

abstract class Boid extends SpaceObject{

  //PVector loc;
  //PVector vel;
  //PVector acc;
  float r;
  //float maxforce;    // Maximum steering force
  //float maxspeed;    // Maximum speed
  float wandertheta;
  color pColor=color(0, 175, 175); 
  PVector myTargetLoc;
  Boid boidTarget;
  
  int maxhitPoints=10;

  int hitPoints=10;
  boolean isDead=false;


  //each boid should have a buffer of shots?
  Shot[] shots = new Shot[3];
  boolean fire=false;


  Boid(PVector l, float ms, float mf) {
    
    super( l,  ms,  mf);
    //acc = new PVector(0,0);
    //vel = new PVector(0,0);
    //loc = l.get();
    r = 3.0;
    //maxspeed = ms;
    //maxforce = mf;
    
    if(this.loc==null)
    {
     System.out.println("loc is null"); 
    }
    
    //super (loc, vel, acc,mmaxspeed );
  }

  PVector getMyTarget()
  {
    return myTargetLoc;

  }

  void setMyTarget(PVector b)
  {

    myTargetLoc=b;
  }

  void setBoidTarget(Boid b)
  {
    boidTarget=b;
    myTargetLoc=b.loc;
  }

  void run() {
    update();
    isDead();
    if(fire)
    {
      //System.out.println(fire);
      float num1=vel.heading2D();

      shots[0]=new Shot(new PVector(loc.x,loc.y),new PVector(20*cos(num1),20*sin(num1)), myTargetLoc, myPlanet.r); 
      shots[0].run();
      if(boidTarget!=null)
      {
        boidTarget.hitPoints--;
      }


    }
    else
    {
      shots[0]=null; 
    }
    //borders();
    boundaries();
    render();
  }

  void isDead()
  {
    if(hitPoints<=0)
    {
      isDead=true;
      incExpCount();
      e[explosionCounter] =new Explosion((int)this.loc.x, (int)this.loc.y, 20,20); 

    } 
  }

  void run(Vector boids) {
    flock(boids);
    update();
    //borders();
    boundaries();
    render();
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(Vector boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  // Method to update location
  /*void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }*/

  void seek(PVector target) {
    acc.add(steer(target,false));
    flock(seekers.boids);
    //System.out.println("seek is being called");
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
    flock(arrivers.boids);
  }

  void leaderFollow(Boid target)
  {
    //separation
    
    
    //arrival at point behind leader
    PVector pBehind=getPointBehindLeader(target);
    arrive(pBehind);
    
    //move out of way of future path.

  }
  
  PVector getPointBehindLeader(Boid target)
  {
    PVector vel=target.vel;
    PVector tloc= target.loc;   
    PVector behind = tloc;
    
    float distBehind=30;
    
    
    return behind;
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


  //Draw the Boid
  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + radians(90);
    //fill(175);
    fill(pColor);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
  
  void boundaries() {
    if (loc.x -r < 0) vel.x=-vel.x;//loc.x = r;
    if (loc.y -r< 0) vel.y=-vel.y;//loc.y = r;
    if (loc.x +r> width) vel.x=-vel.x;//loc.x = width-r;
    if (loc.y +r> height) vel.y=-vel.y;//loc.y = height-r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (Vector boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
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
  PVector align (Vector boids) {
    float neighbordist = 50.0;
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
  PVector cohesion (Vector boids) {
    float neighbordist = 50.0;
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

  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField f) {

    // Look ahead
    PVector ahead = vel.get();
    ahead.normalize();
    ahead.mult(32); // Arbitrarily look 32 pixels ahead
    PVector lookup = PVector.add(loc,ahead);

    // Draw in debug mode
    if (debug) {
      stroke(0);
      line(loc.x,loc.y,lookup.x,lookup.y);
      fill(0);
      ellipse(lookup.x,lookup.y,3,3);
    }

    // What is the vector at that spot in the flow field?
    PVector desired = f.lookup(lookup);
    // Scale it up by maxspeed
    desired.mult(maxspeed);
    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    acc.add(steer);
  }


  void wander() {
    float wanderR = 16.0f;         // Radius for our "wander circle"
    float wanderD = 60.0f;         // Distance for our "wander circle"
    float change = 0.25f;
    wandertheta += random(-change,change);     // Randomly change wander theta

    // Now we have to calculate the new location to steer towards on the wander circle
    PVector circleloc = vel.get();  // Start with velocity
    circleloc.normalize();            // Normalize to get heading
    circleloc.mult(wanderD);          // Multiply by distance
    circleloc.add(loc);               // Make it relative to boid's location

    PVector circleOffSet = new PVector(wanderR*cos(wandertheta),wanderR*sin(wandertheta));
    PVector target = PVector.add(circleloc,circleOffSet);
    acc.add(steer(target,false));  // Steer towards it

    // Render wandering circle, etc. 
    if (debug) drawWanderStuff(loc,circleloc,target,wanderR);

  }  

  // A method just to draw the circle associated with wandering
  void drawWanderStuff(PVector loc, PVector circle, PVector target, float rad) {
    stroke(0); 
    noFill();
    ellipseMode(CENTER);
    ellipse(circle.x,circle.y,rad*2,rad*2);
    ellipse(target.x,target.y,4,4);
    line(loc.x,loc.y,circle.x,circle.y);
    line(circle.x,circle.y,target.x,target.y);
  }



  ///for path following
  // This function implements Craig Reynolds' path following algorithm
  // http://www.red3d.com/cwr/steer/PathFollow.html
  void follow1(Path p) {

    // Predict location 25 (arbitrary choice) frames ahead
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(loc, predict);

    // Draw the predicted location
    if (debug) {
      fill(0);
      stroke(0);
      line(loc.x,loc.y,predictLoc.x, predictLoc.y);
      ellipse(predictLoc.x, predictLoc.y,4,4);
    }

    // Now we must find the normal to the path from the predicted location
    // We look at the normal for each line segment and pick out the closest one
    PVector target = null;
    PVector dir = null;
    float record = 1000000;  // Start with a very high record distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < p.points.size()-1; i++) {

      // Look at a line segment
      PVector a = (PVector) p.points.get(i);
      PVector b = (PVector) p.points.get(i+1);

      // Get the normal point to that line
      PVector normal = getNormalPoint(predictLoc,a,b);

      // Check if normal is on line segment
      float da = PVector.dist(normal,a);
      float db = PVector.dist(normal,b);
      PVector line = PVector.sub(b,a);
      // If it's not within the line segment, consider the normal to just be the end of the line segment (point b)
      if (da + db > line.mag()+1) {
        normal = b.get();
      }

      // How far away are we from the path?
      float d = PVector.dist(predictLoc,normal);
      // Did we beat the record and find the closest line segment?
      if (d < record) {
        record = d;
        // If so the target we want to steer towards is the normal
        target = normal;

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        dir = line;
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & velocity
        dir.mult(10);
      }
    }

    // Draw the debugging stuff
    if (debug) {
      // Draw normal location
      fill(0);
      noStroke();
      line(predictLoc.x,predictLoc.y,target.x,target.y);
      ellipse(target.x,target.y,4,4);
      stroke(0);
      // Draw actual target (red if steering towards it)
      line(predictLoc.x,predictLoc.y,target.x,target.y);
      if (record > p.radius) fill(255,0,0);
      noStroke();
      ellipse(target.x+dir.x, target.y+dir.y, 8, 8);
    }

    // Only if the distance is greater than the path's radius do we bother to steer
    if (record > p.radius) {
      target.add(dir);
      seek(target);			
    }
  }
  // This function implements Craig Reynolds' path following algorithm
  // http://www.red3d.com/cwr/steer/PathFollow.html
  PVector follow(Path p) {

    // Predict location 25 (arbitrary choice) frames ahead
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(loc, predict);

    // Draw the predicted location
    if (debug) {
      fill(0);
      stroke(0);
      line(loc.x,loc.y,predictLoc.x, predictLoc.y);
      ellipse(predictLoc.x, predictLoc.y,4,4);
    }

    // Now we must find the normal to the path from the predicted location
    // We look at the normal for each line segment and pick out the closest one
    PVector target = null;
    PVector dir = null;
    float record = 1000000;  // Start with a very high record distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < p.points.size(); i++) {

      // Look at a line segment
      PVector a = (PVector) p.points.get(i);
      PVector b = (PVector) p.points.get((i+1)%p.points.size());  // Path wraps around

      // Get the normal point to that line
      PVector normal = getNormalPoint(predictLoc,a,b);

      // Check if normal is on line segment
      float da = PVector.dist(normal,a);
      float db = PVector.dist(normal,b);
      PVector line = PVector.sub(b,a);
      // If it's not within the line segment, consider the normal to just be the end of the line segment (point b)
      if (da + db > line.mag()+1) {
        normal = b.get();
        // If we're at the end we really want the next line segment for looking ahead
        a = (PVector) p.points.get((i+1)%p.points.size());
        b = (PVector) p.points.get((i+2)%p.points.size());  // Path wraps around
        line = PVector.sub(b,a);
      }

      // How far away are we from the path?
      float d = PVector.dist(predictLoc,normal);
      // Did we beat the record and find the closest line segment?
      if (d < record) {
        record = d;
        // If so the target we want to steer towards is the normal
        target = normal;

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        dir = line;
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & velocity
        dir.mult(25);
      }
    }

    // Draw the debugging stuff
    if (debug) {
      // Draw normal location
      fill(0);
      noStroke();
      line(predictLoc.x,predictLoc.y,target.x,target.y);
      ellipse(target.x,target.y,4,4);
      stroke(0);
      // Draw actual target (red if steering towards it)
      line(predictLoc.x,predictLoc.y,target.x,target.y);
      if (record > p.radius) fill(255,0,0);
      noStroke();
      ellipse(target.x+dir.x, target.y+dir.y, 8, 8);
    }

    // Only if the distance is greater than the path's radius do we bother to steer
    if (record > p.radius || vel.mag() < 0.1) {
      target.add(dir);
      return steer(target,false);		
    } 
    else {
      return new PVector(0,0);
    }
  }

  // A function to get the normal point from a point (p) to a line segment (a-b)
  // This function could be optimized to make fewer new Vector objects
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p,a);
    // Vector from a to b
    PVector ab = PVector.sub(b,a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a,ab);
    return normalPoint;
  }

  // A function to deal with path following and separation
  void applyForces(Vector boids, Path path) {
    // Follow path force
    PVector f = follow(path);
    // Separate from other boids force
    PVector s = separate(boids);
    // Arbitrary weighting
    f.mult(3);
    s.mult(1);
    // Accumulate in acceleration
    acc.add(f);
    acc.add(s);
  }




  void decreaseHitPoints()
  {
   hitPoints--; 
    
  }
}




