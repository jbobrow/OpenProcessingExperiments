
class boid {
  
  // pos, loc, vel, frc
  PVector loc = new PVector();
  PVector vel = new PVector();
  PVector frc = new PVector();
  
  // mass, radius
  float mass = 1.0;
  
  // maximum force, speed
  float maxforce = 0.05;
  float maxspeed = 3.0;
  
  // behaviour weights
  float alignweight = 1.0;
  float sepweight = 1.0;
  float cohesionweight = 1.0;
  
  // behaviour variables
  float neighbourhood = 25.0;
  
  // constructor
  boid() {
  }
  
  // update
  void update(ArrayList boids) {
    // reset force
    frc = new PVector();
    // add all forces
    frc.add(align(boids));
    frc.add(separate(boids));
    frc.add(cohesion(boids));
    // update vel
    vel.add(PVector.div(frc,mass));
    // update pos
    loc.add(vel);
    boundary();
  }
  
  // draw
  void render() {
    float theta = vel.heading2D() + PI/2;
    fill(theta,50,100);
    stroke(theta,50,100);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -2*2);
    vertex(-2, 2*2);
    vertex(2, 2*2);
    endShape();
    popMatrix();
  }
  
  // align
  PVector align(ArrayList boids){
    // temp variables
    float count = 0.0;
    PVector sum = new PVector();
    // loop through and find neighbours
    for(int i = 0; i < boids.size(); i++) {
      boid b = (boid) boids.get(i);
      // find distance
      float d = loc.dist(b.loc);
      // add to average velocity
      if(d > 0 && d < neighbourhood) {
        count+=1.0;
        sum.add(b.vel);
      }
    }
    // average steer
    if(count > 0 ) {
      sum.div(count);
    }
    // if stter > 0 then calculate force
    if(sum.mag() > 0) {
      sum.normalize();
      sum.mult(maxspeed);
      sum.sub(vel);
      sum.limit(maxforce);
    }
    // return force
    return sum;
  }
  
  // separate
  PVector separate(ArrayList boids){
   // temp variables
    float count = 0.0;
    PVector sum = new PVector();
    // loop through and find neighbours
    for(int i = 0; i < boids.size(); i++) {
      boid b = (boid) boids.get(i);
      // find distance
      float d = loc.dist(b.loc);
      // add to average velocity
      if(d > 0 && d < neighbourhood*0.75) {
        count+=1.0;
        PVector diff = PVector.sub(loc,b.loc);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
      }
    }
    // average steer
    if(count > 0 ) {
      sum.div(count);
    }
    // if stter > 0 then calculate force
    if(sum.mag() > 0) {
      sum.normalize();
      sum.mult(maxspeed);
      sum.sub(vel);
      sum.limit(maxforce*1.5);
    }
    // return force
    return sum;    
  }
  
  // cohesion
  PVector cohesion(ArrayList boids){
    // temp variables
    float count = 0.0;
    PVector sum = new PVector();
    // loop through and find neighbours
    for(int i = 0; i < boids.size(); i++) {
      boid b = (boid) boids.get(i);
      // find distance
      float d = loc.dist(b.loc);
      // add to average position
      if(d > 0 && d < neighbourhood) {
        count+=1.0;
        sum.add(b.loc);
      }
    }
    // steer towards average position
    if(count > 0) {
      sum.div(count);
      return steer(sum);
    } else {
      return sum;
    }
  }
  
  // steer behaviour
  PVector steer(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxspeed);
    desired.sub(vel);
    desired.limit(maxforce);
    return desired;
  }
  
  // boundary
  void boundary() {
    loc.x = (loc.x + width) % width;
    loc.y = (loc.y + height) % height;
  }
  
}

