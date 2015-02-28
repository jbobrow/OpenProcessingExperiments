
class Boid {
  //-----------------------------------------------------------------------------
  //properties
  //-----------------------------------------------------------------------------
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float mf;    // Maximum steering force
  float ms;    // Maximum speed

  float neighbordist = 120.0;
  float desiredseparation = 20.0;
  float multi = 0.01;

  //-----------------------------------------------------------------------------
  //constructor
  //-----------------------------------------------------------------------------
  Boid(PVector l, float ms, float mf) {
    acc = new PVector(0,0);
    vel = new PVector(random(-1,1),random(-1,1));
    loc = l.get();
    r = 2.0;
    this.ms = ms;
    this.mf = mf;
  }

  //-----------------------------------------------------------------------------
  //display
  //-----------------------------------------------------------------------------
  void render() {
    //float theta = vel.heading2D() + PI/2;
    pushMatrix();
    //rotate(theta);
    point(loc.x,loc.y);
    popMatrix();
  }

  void run(ArrayList boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion

    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);

    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  PVector average(ArrayList boids) {
    PVector avg = new PVector(0,0);
    for(int i=0; i<boids.size(); i++) { //i+=(boids.size()*multi)) {
      Boid other = (Boid) boids.get(i);
      avg.add(other.loc);    
    }

    avg.div(boids.size());
    return avg;
  }

  //-----------------------------------------------------------------------------
  // Wraparound
  //-----------------------------------------------------------------------------
  void borders() {
    /*
    if(loc.x < -r) loc.x = width+r;
    if(loc.y < -r) loc.y = height+r;
    if(loc.x > width+r) loc.x = -r;
    if(loc.y > height+r) loc.y = -r;
    */
  }
 
  //-----------------------------------------------------------------------------
  // update location
  //-----------------------------------------------------------------------------
  void update() {
    vel.add(acc);
    vel.limit(ms);
    loc.add(vel);
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }

  //-----------------------------------------------------------------------------
  //Steering
  //Takes a second argument, if true, it slows down as it approaches the target
  //-----------------------------------------------------------------------------
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;
    PVector desired = target.sub(target,loc);
    float d = desired.mag();

    if(d > 0) {
      desired.normalize();
      //Two options for desired vector magnitude (1 -- based on distance, 2 -- ms)
      //This damping is somewhat arbitrary
      if((slowdown) && (d < 100.0)) desired.mult(ms*(d/100.0));
      else desired.mult(ms);
      steer = target.sub(desired,vel);
      steer.limit(mf);
    } else {
      steer = new PVector(0,0);
    }
    return steer;
  }

  //-----------------------------------------------------------------------------
  // Separation
  // Method checks for nearby boids and steers away
  //-----------------------------------------------------------------------------
  PVector separate (ArrayList boids) {
    PVector steer = new PVector(0,0,0);
    int count = 0;

    for(int i=0; i<boids.size(); i++) { //i+=(boids.size()*multi)) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);

      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }

    if(count > 0) steer.div((float)count);
    if(steer.mag() > 0) {
      steer.normalize();
      steer.mult(ms);
      steer.sub(vel);
      steer.limit(mf);
    }
    return steer;
  }

  //-----------------------------------------------------------------------------
  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  //-----------------------------------------------------------------------------
  PVector align(ArrayList boids) {
    PVector steer = new PVector(0,0,0);
    int count = 0;

    for(int i=0; i<boids.size(); i++) { //i+=(boids.size()*multi)) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if((d > 0) && (d < neighbordist)) {
        steer.add(other.vel);
        count++;
      }
    }

    if(count > 0) steer.div((float)count);
    if(steer.mag() > 0) {
      steer.normalize();
      steer.mult(ms);
      steer.sub(vel);
      steer.limit(mf);
    }
    return steer;
  }

  //-----------------------------------------------------------------------------
  // Cohesion
  // For the average location (i.e. center) of all nearby boids,
  // calculate steering vector towards that location
  //-----------------------------------------------------------------------------
  PVector cohesion(ArrayList boids) {
    PVector sum = new PVector(0,0);
    int count = 0;
    for(int i=0; i<boids.size(); i++) { //i+=(boids.size()*multi)) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);

      if((d > 0) && (d < neighbordist)) {
        sum.add(other.loc);
        count++;
      }
    }

    if(count > 0) {
      sum.div((float)count);
      return steer(sum,false);
    }
    return sum;
  }
}




