
// The Boid class

class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  //float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float maxVertspeed; //  Maximum speed vertical
  float maxVertforce; //  Maximum speed vertical
  int lifeTime;
  
  float desiredseparation;// Distance to separate from neighbours
  float neighbordistAlgn; // Distance to align with neighbours
  float neighbordist;     // Distance to stick to neighbours
  float desiredAvoidDist; // Distance to avoid Avoid Hunters
  
  float r,g,b,alpha;
  


  Boid(PVector l, float ms, float mf, int lt) {
    acc = new PVector(0, 0, 0 );
    vel = new PVector(0, 0, 0);
    loc = l.get();
    r = 2.0;
    maxspeed = ms;
    maxforce = mf;
    lifeTime= lt;
    maxVertspeed=ms*3;
    
    desiredseparation = 30.0;
    neighbordistAlgn = 15.0;
    neighbordist = 40.0;
    desiredAvoidDist = 300;
   
    
  }

  void run(ArrayList boids, ArrayList hunters, GL gl) {
    flock(boids, hunters, gl);
    update();
   // borders();
    render(gl);
    lifeTime-=1;
  }

  void run(ArrayList boids, GL gl) {
    flock(boids, gl);
    update();
    //borders();
    render(gl);
    lifeTime-=1;
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids, ArrayList hunters, GL gl) {
    PVector sep = separate(boids);   // Separation
    PVector avd = avoid(hunters);    // Avoid Hunter
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids, gl);   // Cohesion
    PVector target = target();              // Food
    // Arbitrarily weight these forces
    sep.mult(2);
    ali.mult(0.5);
    coh.mult(1.0);
    avd.mult(1.0);
    target.mult(1.5);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(avd);
    acc.add(ali);
    acc.add(coh);
    acc.add(target);
  }
  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids, GL gl) {
    PVector sep = separate(boids);   // Separation
    //PVector avd = avoid(hunters);    // Avoid Hunter
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids, gl);   // Cohesion
    PVector target = target();              // Food
    // Arbitrarily weight these forces
    sep.mult(2);
    ali.mult(0.5);
    coh.mult(1.0);
    //avd.mult(2.5);
    target.mult(1.0);
    // Add the force vectors to acceleration
    acc.add(sep);
    //acc.add(avd);
    acc.add(ali);
    acc.add(coh);
    acc.add(target);
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
  
void render(GL gl) {
    PVector modelOrientation = new PVector(0, 0, 1); 
    PVector heading=new PVector(vel.x, vel.y, vel.z);
    heading.mult(2);
    //    heading.normalize();
    //    float angle = acos(modelOrientation.dot(heading)); 
    //    PVector axis = modelOrientation.cross(heading); 
    //    pushMatrix();
    int lines=5;
    gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
    for (int i=lines;i>0;i-=4) {
      gl.glLineWidth(i);
      gl.glColor4f(float(1-i/lines), 0.5-i/lines, 0.2+i/lines, 
      alpha*2/i);
//      gl.glColor4f(1-alpha*i/lines, 0.5-alpha*i/lines, 0.2+alpha*i/lines, 
//      alpha/i/i);
      gl.glBegin(GL.GL_LINES); 
      gl.glVertex2f(loc.x-heading.x, loc.y-heading.y);
      gl.glVertex2f(loc.x, loc.y);
      gl.glEnd();
    }
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
    PVector desired = target.sub(target, loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = target.sub(desired, vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0, 0, 0);
    }
    return steer;
  }

  // Wraparound
  void borders() {
    if (loc.x < r) loc.x = width-r;
    if (loc.y < r) loc.y = height-r;
    if (loc.x > width-r) loc.x = r;
    if (loc.y > height-r) loc.y = r;
    if (loc.z < r) loc.z = height-r;
    if (loc.z > height-r) loc.z = r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);

      //verändert, damit der Scwarm besser zusammenhält
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation/3)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d*10);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }

      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d/16);        // Weight by distance
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
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < neighbordistAlgn)) {
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
  PVector cohesion (ArrayList boids, GL gl) {
    PVector sum = new PVector(0, 0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    
 
    gl.glEnable( GL.GL_BLEND ); 
    

    // Define the blend mode
    //gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
    gl.glColor4f(0.95, 0.3, 0.2, 0.01);
      gl.glLineWidth(8);
      gl.glBegin(GL.GL_POLYGON); 
      gl.glVertex2f(loc.x, loc.y);
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      
      
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.loc); // Add location
        count++;
        
        
      gl.glVertex2f(other.loc.x, other.loc.y);
      }
       
    }
    gl.glEnd();
 //ggl.glEnable( GL.GL_BLEND ); 
  // gl.glDisable(GL.GL_BLEND);
   
    
    // für Farbverdichtungen
   // println(count);
    alpha = map(count,0,50,0,1);
    // println(alpha);
     
    
    
    
    
    
    if (count > 0) {
      sum.div((float)count);
      return steer(sum, true);  // Steer towards the location
    }
    return sum;
  }

  // Avoid Target
  // Method checks for nearby hunters and steers away
  PVector avoid (ArrayList hunters) {
    PVector steer = new PVector(0, 0, 0);
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < hunters.size(); i++) {
      Hunter hunter = (Hunter) hunters.get(i);
      float d = PVector.dist(loc, hunter.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from the hunter
        PVector diff = PVector.sub(loc, hunter.loc);
        diff.normalize();
        diff.div(d*4);        // Weight by distance
        steer.add(diff);
      }
    }
    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed*2);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }
 
  // Move Towards Target
  PVector target () {
    PVector sum = new PVector(0,0, 0);   // Start with empty vector to accumulate all locations
     //sum.limit(maxforce);
    return steer(sum, true);  // Steer towards the location
  }

  boolean alive() {
    if (lifeTime<0) return false;
    else return true;
  }
}


