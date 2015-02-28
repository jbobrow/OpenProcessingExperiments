
//Global Variables
color BLACK = color(0);
System s;
Scout test;
float pull = 8.0f;

//Setup
void setup() {
  size(800, 400);
  background(BLACK);
  s = new System();
  test = new Scout();
  for (int i = 0; i < 500; i++) {
    s.addApis(new Apis(new PVector(width/2,height/2),pull,0.05f));
  }
}

//Draw
void draw() {
  background(BLACK);
  s.run();
  test.run(s.hive);
}

// Add a new Apis into the System
void mousePressed() {
  for (int i = 0; i < 100; i++) {  
    s.addApis(new Apis(new PVector(mouseX,mouseY),pull,0.05f));
  }
}






//Apis class
class Apis {
  color cApis = color(0,255,0); //color of Apis
  PVector loc; //location vector
  PVector vel; //velocity vector
  PVector acc; //acceleration vetor

  float r = 5.0; //radius of Apis
  float ms; //maxspeed of Apis
  float mt; //maxturn of Apis
  float inertia = 3.0; //inertia of bee
  float friction = .9; //friction of turn

  //empty constructor
  Apis() {
    loc = new PVector(); //location at 0,0
    ms = 8.0f;
    mt = 0.05f;
    acc = new PVector(); //set acceleration vector to 0
    vel = new PVector(random(-1,1), random(-1,1)); //randomize velocity vector
  }

  //full constructor
  Apis(PVector _loc, PVector _vel, PVector _acc, float _ms, float _mt) {
    loc = _loc.get();
    vel = _vel.get();
    acc = _acc.get();
    ms = _ms;
    mt = _mt;
  }

  //simplified constructor
  Apis(PVector _loc, float _ms, float _mt) {
    loc = _loc.get();
    ms = _ms;
    mt = _mt;
    acc = new PVector(0,0); //set acceleration vector to 0
    vel = new PVector(random(-1,1), random(-1,1)); //randomize velocity vector
  }

  /* Motion Method:
   Adds velocity vector to the location vector
   and the acceleration vector to the velocity
   vector
   */
  void motion() {
    vel.add(acc); //update velocity
    vel.limit(ms); //limit velocity vector
    loc.add(vel); //update location vector
    acc.mult(0); //reset acceleration to zero after every cycle
  }

  //Preliminary rendering of bee. Used for testing the hive System
  void render() {
    pushMatrix();
    stroke(cApis);
    noFill();
    ellipse(loc.x, loc.y, r, r);
    popMatrix();
  }

  //wraparound
  void wrap() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }

  //Returns an attraction vector based on the swarm
  PVector attract(ArrayList hive) {
    float maxpull = 4; //max attraction
    float maxd = 600; //max distance
    PVector attract = new PVector(0,0); //will hold the sum of all of the aAttract vectors
    PVector aAttract = new PVector(0,0); //will hold the attraction vector toward the nearest Apis    
    for (int i = 0; i < hive.size(); i++) { //parse through entire hive
      Apis neighbor = (Apis) hive.get(i);
      float d = loc.dist(neighbor.loc); //distance between selected Apis and this Apis
      if (d > 0 && d < maxd) {
        aAttract.x = loc.x - neighbor.loc.x; //create a vector that points from this Apis to the neighbor
        aAttract.y = loc.y - neighbor.loc.y;
        attract.x += -1/aAttract.x; //add the vector x component to the final attract vector
        attract.y += -1/aAttract.y; //add the vector y component to the final vector
      }      
    }    
    //attract.x = (attract.x > maxpull ? maxpull : attract.x < -maxpull ? -maxpull: attract.x);
    //attract.y = (attract.y > maxpull ? maxpull : attract.y < -maxpull ? -maxpull: attract.y);
    attract.limit(maxpull); //limit the attract vector to a maxpull. Failure to limit causes bees to center toward one area    
    return attract;
  }

  //network hive
  void network(ArrayList hive) {    
    for (int i = 0; i < hive.size(); i++) {
      Apis neighbor = (Apis) hive.get(i);
      float d = loc.dist(neighbor.loc);
      if (d > 0) {
        pushMatrix();
        stroke(255%d,255%d,0);
        line(loc.x, loc.y, neighbor.loc.x, neighbor.loc.y);
        popMatrix();
      }
    }
  }

  //change color of Apis
  void selected() {
    cApis = color(255,0,0);
  }


  //Implements target steering as modeled by Craig Reynolds
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(ms*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(ms);
      // Steering = Desired minus Velocity
      steer = target.sub(desired,vel);
      steer.limit(mt);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }

  //bee steers toward predefined target
  void track(PVector target) {
    acc.add(steer(target, false));
  }

  //runs entire bee. Later version will have a "swarm switch" which will allow some to leave the swarm
  void run(ArrayList hive) {
    PVector v;
    v = attract(hive);
    v.mult(1/inertia);
    acc = v;

    motion();
    wrap();
    //network(hive);  //will draw lines from the bee to all other bees
    render();
  }
}



////SCOUT CLASSS
class Scout extends Apis {
  PVector randomMove(PVector tar) {
    PVector iUnit = new PVector(1,0); //x-axis
    PVector v = new PVector(); //holds returned velocity vector
    float rV = random(.5f, .6f); //random speed
    float theta = tar.angleBetween(tar,iUnit);
    //-------------------------
    theta += random(-PI, PI); //randomize theta w/ errorbound
    v.x = rV * sin(theta);
    v.y = rV * cos(theta);
    v.limit(ms);
    
    return v;
  }
  
  void run(ArrayList hive) {
    acc = randomMove(new PVector(width, height));
    motion();
    wrap();
    cApis = color(255,0,0);
    render();
  }
}


//System class (an ArrayList of Apis objects)
class System {
  ArrayList hive; // An arraylist for all Apis


  System() {
    hive = new ArrayList(); // Initialize the arraylist

  }

  void run() {
    for (int i = 0; i < hive.size(); i++) {
      Apis a = (Apis) hive.get(i);  
      a.run(hive);  // Passing the entire list of boids to each boid individually
      a.ms = mouseX/10 + 1; //illustrates the swarming behaviour when maxspeed (ms) is changed
      if ((keyPressed == true) && ((key == 'n') || (key == 'N'))) {
        a.network(hive);
      }
    }
  }

  void addApis(Apis a) {
    hive.add(a);    
  }
}

















