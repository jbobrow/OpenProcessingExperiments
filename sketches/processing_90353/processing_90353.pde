
class Agent {
  float mass;
  float energy;
  PVector pos; // Position
  PVector vel; // Velocity
  PVector acc; // Acceleration
  PVector w;
  int type; // Agent type
  float wdelta; // Wander delta
  int action; // Current action
  int prey; // Predator's target
  // Weights
  float wArr; //arrive mouse click
  float wDep; //depart mouse click
  float wPur; //pursue boid
  float wEva; //evade predator
  float wWan; //wander aimlessly
  float wAvo; //avoid objects
  float wFlo; //flock--combo of following 3
  float wCoh; //coherence
  float wSep; //separation
  float wAli; //alignment

  Agent(float px, float py, int t) {//constructor
    mass = 10.0;
    energy = 10*ceil(random(5, 10));
    pos = new PVector(px, py);
    vel = new PVector(random(-5, 5), random(-5, 5));
    acc = new PVector();
    type = t;
    wdelta = 0.0;
    action = 0;
    updateweight();
  }

  void run(ArrayList boids, ArrayList predators, ArrayList objs) {
    acc.set(0, 0, 0); // Reset accelertion to 0 each cycle
    steer(boids, predators, objs); // Update steering with approprate behavior
    vel.add(acc); // Update velocity
    switch (action) {
      case 1: vel.limit(maxpursue); break; // Limit pursue speed
      case 2: vel.limit(maxevade); break; // Limit evade speed
      default: vel.limit(maxspeed); break; // Limit speed      
    }
    pos.add(vel); // Move agent
    w = new PVector(xWind/20, yWind/20);
    pos.add(w);
    bounding(); // Wrap around the screen or else...
    updateweight(); // Updates weights
    render();
  }

  void steer(ArrayList boids, ArrayList predators, ArrayList objs) { 
    if (type == 2) predator(boids); // Determine current action
    // Initialize steering forces
    PVector arr = new PVector(); //arrive (mouse click)
    PVector dep = new PVector(); //depart (mouse click)
    PVector pur = new PVector(); //pursuing
    PVector eva = new PVector(); //evading
    PVector wan = new PVector(); //wandering
    PVector flo = new PVector(); //flock
    PVector avo = new PVector(); //avoid
    // Calculate steering forces
    switch (action) {
      // Evading
      case 1: {
        eva = evade(predators);
        avo = avoid(objs); 
        break; 
      }
      // Pursuing
      case 2: {
        pur = pursue(boids);
        avo = avoid(objs);  
        break;
      }
      // Wandering
      default: {
        if (type == 1) {
          wan = wander(); 
          avo = avoid(objs);
          flo = flocking(boids);
          eva = evade(predators);
          break;
        }
        if (type == 2) {
          wan = wander(); 
          avo = avoid(objs);
          break;
        }
      }      
    }
    // User interaction
    if(keyPressed){
      // Left mouse button - Arrival
      if (mouseButton == LEFT && type == 1) {
        if (key == 'q'){
        PVector mouse = new PVector(mouseX, mouseY);
        arr = arrival(mouse);
        }
      
    }
      // Right mouse button - Departure
      else if (mouseButton == RIGHT) {
        PVector mouse = new PVector(mouseX, mouseY);
        dep = departure(mouse);
        dep.mult(maxevade);
      }
    }
    // Apply weights
    arr.mult(wArr);
    dep.mult(wDep);
    pur.mult(wPur);
    eva.mult(wEva);
    wan.mult(wWan);
    avo.mult(wAvo);
    flo.mult(wFlo);
    // Accumulate steering force
    acc.add(arr);
    acc.add(dep);
    acc.add(pur);
    acc.add(eva);
    acc.add(wan);
    acc.add(avo);
    acc.add(flo);
    acc.limit(maxforce); // Limit to maximum steering force
  }
  
  void predator(ArrayList boids) {
    if (energy > 0) energy -= random(0.5);
    if (energy < 0) energy = 10*ceil(random(5, 10));
    if (energy < 20 && action == 0) { //low energy, pursue boid
      action = 2;
      prey = int(random(boids.size() - 1)); //pick random boid to attack
    }        
    if (energy > 20 && action == 2) action = 0;
  }

  PVector seek(PVector target) {
    PVector steer; // The steering vector
    PVector desired = PVector.sub(target, pos); // A vector pointing from current location to the target
    float distance = mag2(desired); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (distance > 0) {     
      desired.normalize(); // Normalize desired
      desired.mult(maxforce);
      steer = PVector.sub(desired, vel); // Steering = Desired minus Velocity
    }
    else {
      steer = new PVector(0, 0);
    }
    return steer;
  }

  PVector flee(PVector target) {
    PVector steer; // The steering vector
    PVector desired = PVector.sub(target, pos); // A vector pointing from current location to the target
    float distance = mag2(desired); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (distance > 0 && distance < (ARadius*100)*(ARadius*100)) {
      desired.normalize(); // Normalize desired
      desired.mult(maxforce);
      steer = PVector.sub(vel, desired); // Steering = Desired minus Velocity
    }
    else {
      steer = new PVector(0, 0);
    }
    return steer;
  }

  PVector arrival(PVector target) {
    PVector steer; // The steering vector
    PVector desired = PVector.sub(target, pos); // A vector pointing from current location to the target
    float distance = mag2(desired); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (distance > 0) {
      desired.normalize(); // Normalize desired
      if (distance < ARadius*ARadius) {
        distance = (float) Math.sqrt(distance);
        desired.mult(maxspeed*(distance/ARadius)); // This damping is somewhat arbitrary
      }
      else desired.mult(maxforce);
      steer = PVector.sub(desired, vel); // Steering = Desired minus Velocity
    }
    else {
      steer = new PVector();
    }
    return steer;
  }

  PVector departure(PVector target) {
    PVector steer; // The steering vector
    PVector desired = PVector.sub(target, pos); // A vector pointing from current location to the target
    float distance = mag2(desired); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (distance > 0 && distance < (ARadius*100)*(ARadius*100)) {
      desired.normalize(); // Normalize desired
      if (distance < ARadius*ARadius) {
        distance = (float) Math.sqrt(distance);
        desired.mult(maxspeed*(ARadius/distance)); // This damping is somewhat arbitrary
      }
      else desired.mult(maxforce);
      steer = PVector.sub(vel, desired); // Steering = Desired minus Velocity
    }
    else {
      steer = new PVector();
    }
    return steer;
  }

  
  PVector pursue(ArrayList boids) {
    PVector steer = new PVector();
    if (prey < boids.size()) {
      Agent boid = (Agent) boids.get(prey);
      steer = PVector.sub(boid.pos, pos);
      steer.mult(maxpursue);
    }
    return steer;
  }
  
  PVector evade(ArrayList predators) {
    PVector steer = new PVector();
    for (int i = 0; i < predators.size(); i++) {
      Agent predator = (Agent) predators.get(i);
      float distance = dist2(pos, predator.pos);
      if (distance < ERadius*ERadius) {
        action = 1;
        steer = flee(predator.pos);
        steer.mult(maxevade);
        return steer;
      }
    }
    action = 0;
    return steer;
  }

  PVector wander() {
    wdelta += random(-NRadius, NRadius); // Determine noise ratio
    // Calculate the new location to steer towards on the wander circle
    PVector center = vel.get(); // Get center of wander circle
    center.mult(60.0); // Multiply by distance
    center.add(pos); // Make it relative to boid's location
    // Apply offset to get new target    
    PVector offset = new PVector(WRadius*cos(wdelta), WRadius*sin(wdelta));
    PVector target = PVector.add(center, offset); // Determine new target
    // Steer toward new target    
    PVector steer = seek(target); // Steer towards it    
    return steer;
  }
  
  PVector avoid(ArrayList objs) {
    PVector steer  = new PVector();    

    for (int i = 0; i < objs.size(); i++) {
      Obj obj = (Obj) objs.get(i);
      // Distance between object and avoidance sphere
      float distance = dist2(obj.pos, pos);
      // If distance is less than the sum of the two radius, there is collision
      float bound = obj.mass*0.5 + BRadius + ORadius;
      if (distance < bound*bound) {
        wAvo = 10.0;
        wWan = 0.1;
        float collision = (obj.mass + mass)*0.5;
        if (distance < collision*collision) {
          steer = PVector.sub(pos, obj.pos);
          steer.mult(maxforce*0.1);
          return steer;
        }
        else {
          float direction = dist2(obj.pos, PVector.add(pos, vel));
          // If is heading toward obstacle
          if (direction < distance) {
            // If steering in the verticle direction
            if (abs(vel.x) <= abs(vel.y)) {   
              steer = new PVector((pos.x - obj.pos.x), vel.y);
              steer.mult(maxforce*((bound*bound)/distance)*0.001);       
            }
            // If steering in the horizontal direction
            else {
              steer = new PVector(vel.x, (pos.y - obj.pos.y));
              steer.mult(maxforce*((bound*bound)/distance)*0.001);  
            }
          }
        }
      }
    }
    return steer;
  }

  PVector flocking(ArrayList boids) {
    // Get steering forces
    PVector steer = new PVector();
    PVector coh = new PVector(); // Perceived center
    PVector sep = new PVector(); // Displacement
    PVector ali = new PVector(); // Perceived velocity
    int count = 0;
    // Agents try to fly towards the centre of mass of neighbouring agents
    // Agents try to keep a small distance away from other objects (including other agents)
    // Agents try to match velocity with near agents
    for (int i = 0; i < boids.size(); i++) {
      Agent boid = (Agent) boids.get(i);
      float distance = dist2(pos, boid.pos);
      // Go through each agents
      if (this != boid && distance < Rn*Rn) {
        coh.add(boid.pos); // Cohesion
        ali.add(boid.vel); // Alignment
        count++;
      }      
      // Separation
      if (this != boid && distance < SDistance*SDistance) {
        PVector diff = PVector.sub(boid.pos, pos); // (agent.position - bJ.position)
        diff.normalize();
        distance = (float) Math.sqrt(distance);
        diff.div(distance); // Weighed by distance
        sep.sub(diff); // c = c - (agent.position - bJ.position)
      }
    }
    if (count > 0) {
      // Cohesion - Step towards the center of mass
      coh.div((float)count); // cJ = pc / (N-1)
      coh.sub(pos); // (pcJ - bJ.position)
      coh.mult(CStep); // (pcJ - bJ.position) / 100
    // Alignment - Find average velocity
      ali.div((float)count); // pvJ = pvJ / N-1
      ali.sub(vel); // (pvJ - bJ.velocity)
      ali.mult(AVelocity); // (pvJ - bJ.velocity) / 8
    }
    // Apply weights
    coh.mult(wCoh);
    sep.mult(wSep);
    ali.mult(wAli);
    // Accumulate forces
    steer.add(coh);
    steer.add(sep);
    steer.add(ali);
    // Add speed
    steer.mult(maxspeed);
    return steer;
  }
  
  // Wrap around or bounded 
  void bounding() {
    if (!bounded) {
      if (pos.x <= BRadius) vel.x = BRadius - pos.x;
      else if (pos.x >= width - BRadius) vel.x = (width - BRadius) - pos.x;
      if (pos.y <= BRadius) vel.y = BRadius - pos.y;
      else if (pos.y >= height - BRadius) vel.y = (height - BRadius) - pos.y;
    }
    else {
      if (pos.x < -mass) pos.x = width + mass;
      if (pos.y < -mass) pos.y = height + mass;
      if (pos.x > width + mass) pos.x = -mass;
      if (pos.y > height + mass) pos.y = -mass;
    }
  }
  
  void updateweight() {
    wArr = KArrive;
    wDep = KDepart;
    wPur = KPursue;
    wEva = KEvade;
    wWan = KWander;
    wAvo = KAvoid;
    wFlo = KFlock;
    wCoh = KCohesion;
    wSep = KSeparate;
    wAli = KAlignment;
  }
  
  void render() {   
    if (type == 1) { //boid
      fill(156, 206, 255);
      stroke(16, 16, 222);
      ellipse(pos.x, pos.y, mass, mass);
      PVector dir = vel.get();
      dir.normalize();
      line(pos.x, pos.y, pos.x + dir.x*10, pos.y + dir.y*10);
    }
    else if (type == 2) { //predator
      // Draw a triangle rotated in the direction of velocity        
//      float theta = vel.heading2D() + radians(90);
//      pushMatrix(); //move triangle's frame of reference
//      translate(pos.x, pos.y);
//      rotate(theta);
//      fill(220, 0, 0);
//      noStroke();
//      beginShape(TRIANGLES);
//      vertex(0, -mass);
//      vertex(-3, mass);
//      vertex(3, mass);
//      endShape();
//      popMatrix();
      fill(222, 0, 0,120); //red boids
      stroke(222, 16, 0);
      ellipse(pos.x, pos.y, mass, mass);
      PVector dir = vel.get();
      dir.normalize();
      line(pos.x, pos.y, pos.x + dir.x*10, pos.y + dir.y*10);
    }
    // Debug mode
    if (debug) {
      // Velocity
      stroke(16, 148, 16);
      line(pos.x, pos.y, pos.x + vel.x*4, pos.y + vel.y*4);
      // Steering
      stroke(255, 0, 0);
      line(pos.x, pos.y, pos.x + acc.x*20, pos.y + acc.y*20);
      // Neighborhood radius
      fill(239, 239, 239, 10);
      stroke(132, 132, 132);
      ellipse(pos.x, pos.y, Rn*2, Rn*2);
      fill(100, 100, 100, 30);
      noStroke();
      ellipse(pos.x, pos.y, BRadius*2, BRadius*2);
      stroke(255, 0, 0);
      noFill();
    }
  }
  
  float dist2(PVector v1, PVector v2) {
    return ((v1.x - v2.x)*(v1.x - v2.x) + (v1.y - v2.y)*(v1.y - v2.y) + (v1.z - v2.z)*(v1.z - v2.z));
  }
  
  float mag2(PVector v) {
    return (v.x*v.x + v.y*v.y + v.z*v.z);
  }
}

