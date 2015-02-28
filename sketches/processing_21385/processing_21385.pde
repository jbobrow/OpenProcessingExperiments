

class Agent {

  Vec3D loc;
  Vec3D vel = new Vec3D(random(-1,1),random(-1,1),0);
  Vec3D acc = new Vec3D();
  float maxforce = 4;
  float maxspeed = 2;

  float desiredSeparation = 5;
  float neighborDist = 400;

  float sepScale = 5;
  float aliScale = 1;
  float cohScale = 0.1;

  int tail = 1;
  float[] xpos = new float[tail];
  float[] ypos = new float[tail];
  float[] zpos = new float[tail];

  float[] xvel = new float[tail];
  float[] yvel = new float[tail];
  float[] zvel = new float[tail];

  int gLocX = 0;
  int gLocY = 0;

  Vec3D futLoc = new Vec3D();
  float sight = 50;

  Vec3D eval1 = new Vec3D();
  Vec3D eval2 = new Vec3D();
  Vec3D eval3 = new Vec3D();

  float wandertheta = 0;

  String tag = "A";

  Agent(Vec3D _loc) {

    loc = _loc;
  }

  void run() {
    //flock();
    wander();
    update();
    borders();
    display();
    calcFutLoc();
    pointBelow(loc, 2);
    //pointBelow(futLoc, 3);
    addPheToPoint();
    evalPheromone();
  }


  void evalPheromone() {

    float minRange = 20;
    float maxRange = 60;
    float minAngle = 0;
    float maxAngle = 40;

    Vec3D sum = new Vec3D();
    int count = 0;

    //loop throught the points
    for (int i = 0; i < resX; i++) {
      for (int j = 0; j < resY; j++) {

        Vec3D ptLoc = new Vec3D(terrain[i][j].loc.x,terrain[i][j].loc.y,loc.z);


        float d = loc.distanceTo(ptLoc);
        Vec3D dif = ptLoc.sub(loc);
        dif.normalize();

        Vec3D v = vel.copy();
        v.normalize();

        float angle = degrees(v.angleBetween(dif));

        if(d < maxRange && d > minRange ) {
          if(angle < maxAngle && angle > minAngle) {

            stroke(255,0,0);
            strokeWeight(1);
            point( ptLoc.x,ptLoc.y);

            float pheAmount = map(terrain[i][j].phe,0,1000,0,1);

            Vec3D dif2 = ptLoc.sub(loc);
            dif2.normalize();
            dif2.scaleSelf(pheAmount);


            //dif2.addSelf(loc);

            sum.addSelf(dif2);  
            //sum.addSelf(ptLoc);
            count++;
          }
        }
      }
    }


    float pheAmount2 = sum.magnitude();

    sum.normalize();
    sum.scaleSelf(30);
    sum.addSelf(loc);

    stroke(0,0,255);
    strokeWeight(1);
    line(loc.x,loc.y, sum.x,sum.y);
    //point( sum.x,sum.y);

    Vec3D steer = sum.sub(loc);
    steer.normalize();
    steer.scaleSelf(3);


    if(pheAmount2 > 0) {
      tag = "B";
    }
    else {
      tag = "A";
    }


    if(tag == "B") {
      acc.addSelf(steer);
    }


    //find points in range and in angle

    //calculate average
    //steer towards average
  }

  void wander() {
    float wanderR = 16;
    float wanderD = 60;
    float change = 0.5;

    wandertheta += random(-change, change);

    Vec3D circleLoc = new Vec3D(vel.x, vel.y, 0);
    circleLoc.normalize();
    circleLoc.scaleSelf(wanderD);
    circleLoc.addSelf(loc); 

    Vec3D circleOffSet = new Vec3D(wanderR*cos(wandertheta),wanderR*sin(wandertheta), 0);
    Vec3D target = circleLoc.addSelf(circleOffSet);

    Vec3D steer = target.sub(loc);
    steer.normalize();
    steer.scaleSelf(1);



    if(tag == "A") {
      acc.addSelf(steer);
    }
  }

  float getPheOfPointBelow(Vec3D v) {

    int lX = int(v.x/gridSize);
    int lY = int(v.y/gridSize);

    if(lX < 0 ) lX = 0;
    if(lY < 0 ) lY = 0;

    if(lX > resX-1 ) lX = resX-1;
    if(lY > resY-1 ) lY = resY-1;


    float p = terrain [lX][lY].phe;

    return p;
  }


  Vec3D calEvalPoints(float angle, float len) {

    Vec3D v = vel.copy();

    v.normalize();

    v.rotateZ(radians(angle));

    v.scaleSelf(len);

    v.addSelf(loc);


    stroke(0,0,255);
    strokeWeight(5);
    point(v.x, v.y);

    strokeWeight(1);
    line(v.x, v.y, loc.x,loc.y);

    return v;
  }


  void addPheToPoint() {

    if(tag == "A") {
      if(terrain [gLocX][gLocY].type == 2) {
        terrain [gLocX][gLocY].phe += 50;
      }
    }
    if(tag == "B") {
      if(terrain [gLocX][gLocY].type == 2) {
        terrain [gLocX][gLocY].phe += 100;
      }
    }
  }



  void calcFutLoc() {

    Vec3D cVel = vel.copy();

    cVel.normalize();
    cVel.scaleSelf(sight);


    cVel.addSelf(loc);

    futLoc = cVel;

    strokeWeight(4);
    stroke(0,255,0);
    point(cVel.x,cVel.y);

    strokeWeight(1);
    line(cVel.x,cVel.y,loc.x,loc.y);
  }

  void pointBelow(Vec3D v, int t) {

    gLocX = int(v.x/gridSize);
    gLocY = int(v.y/gridSize);

    if(gLocX < 0 ) gLocX = 0;
    if(gLocY < 0 ) gLocY = 0;

    if(gLocX > resX-1 ) gLocX = resX-1;
    if(gLocY > resY-1 ) gLocY = resY-1;

    terrain [gLocX][gLocY].type = t;
  }

  void scan() {

    Vec3D dir = new Vec3D(1,0,0);
    acc.addSelf(dir);
  }

  void display() {

    if(tag == "A") {
      stroke(255,0,0);
      strokeWeight(6);
    }
    if(tag == "B") {
      stroke(0,255,0);
      strokeWeight(6);
    }


    point(loc.x,loc.y);
    strokeWeight(1);

    strokeWeight(1);
    //Draw the tail 
    for (int i = 0; i < tail-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
      zpos[i] = zpos[i+1];


      xvel[i] = xvel[i+1];
      yvel[i] = yvel[i+1];
      zvel[i] = zvel[i+1];
    } 
    xpos[tail-1]=loc.x;
    ypos[tail-1]=loc.y;
    zpos[tail-1]=loc.z;


    xvel[tail-1] = vel.x;
    yvel[tail-1] = vel.y;
    zvel[tail-1] = vel.z;

    for (int i = 0; i < tail-1; i++) {
      pushStyle();
      float c = map(i,0,tail,255,0);
      stroke(20,c,255);
      point(xpos[i],ypos[i]);
      popStyle();
    }
  }


  void update() {
    vel.addSelf(acc);
    vel.limit(maxspeed);
    loc.addSelf(vel);
    acc.clear();
  }

  void borders() {
    if (loc.x < 0) loc.x = resX * gridSize;
    if (loc.y < 0) loc.y = resY * gridSize;
    if (loc.x > resX * gridSize) loc.x = 0;
    if (loc.y > resY * gridSize) loc.y = 0;
  }


  void flock() {

    Vec3D sep = separate();   // Separation
    Vec3D ali = align();      // Alignment
    Vec3D coh = cohesion();   // Cohesion

      sep.scaleSelf(sepScale);
    ali.scaleSelf(aliScale);
    coh.scaleSelf(cohScale);

    acc.addSelf(sep);
    acc.addSelf(ali);
    acc.addSelf(coh);
  }

  void seek(Vec3D target) {
    acc.addSelf(steer(target,false));
  }

  void arrive(Vec3D target) {
    acc.addSelf(steer(target,true));
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
  Vec3D separate () {
    Vec3D steer = new Vec3D();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = swarm.size()-1 ; i >= 0 ; i--) {
      Agent other = (Agent) swarm.get(i);
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
  Vec3D align () {
    Vec3D steer = new Vec3D();
    int count = 0;
    for (int i = swarm.size()-1 ; i >= 0 ; i--) {
      Agent other = (Agent) swarm.get(i);
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
  Vec3D cohesion () {
    Vec3D sum = new Vec3D();   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = swarm.size()-1 ; i >= 0 ; i--) {
      Agent other = (Agent) swarm.get(i);
      if (this != other) {
        if (loc.distanceToSquared(other.loc) < neighborDist) {
          sum.addSelf(other.loc); // Add location
          count++;
        }
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
      return steer(sum,false);  // Steer towards the location
    }
    return sum;
  }
}


