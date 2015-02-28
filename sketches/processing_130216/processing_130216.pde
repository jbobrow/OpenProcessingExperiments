
Flock flock;

ValueObject MAXFORCE = new ValueObject();


ValueObject MAXSPEED = new ValueObject();

ValueObject NEIGHBORHOOD = new ValueObject();


ValueObject DESIREDSEPARATION = new ValueObject();


ValueObject ALICONST = new ValueObject();
ValueObject SEPCONST = new ValueObject();
ValueObject COHCONST = new ValueObject();

//Button

ValueObject ST = new ValueObject(100); // state transition

//tuning constants

float rawProgress = 10000;
float energy = 1.0;

boolean drawNeighborhood = false;
boolean drawAcc = false;
boolean drawVel = false;

int GUICount = 0;
int lastObj = 0;

boolean transitioning = false;

int matterState = 0; //0 = solid, .5 = solid transition, 2 = liquid, 3 = lq transition, 4 = gas, 5 = gas transition
int prevState = 0;

PFont f; 
void setup() {
  size(1000, 700);
  flock = new Flock(30);
  smooth();
  
  matterState = 32;
  
  f = createFont("Helvetica", 24);
  textFont(f);
}

void draw() {
  background(255);
  
  //println(progress);
  
  drawHeatingCurve();
  //drawCoolingCurve();
  //explainSolid();
  //explainLiquid();
  //explainGas();
  //explainTransitions();
  int mx = mouseX;
  int my = mouseY;
  //flock.boids.get(0).loc = new PVector(mx,my);
  //flock.boids.get(1).loc = new PVector(width/2,height/2);

  flock.run();

  updateState();
  
}
 

void drawHeatingCurve() {
  
  float v[][] = {{100,500},{200,400},{400,400},{500,300},{700,300},{800,200}}; // 0-5
  rawProgress = max(min(mouseX,v[5][0]),v[0][0]);
  //progress = (rawProgress-100)/7.0;
  
  
  
  if(rawProgress < v[2][0] && matterState >12 ) 
    matterState = 12;
  if(rawProgress > v[2][0] && rawProgress < v[4][0]) 
    matterState = 22;
  if(rawProgress > v[4][0]) 
  matterState = 32;
  
  switch(matterState) {
    case 1:
      energy = (min(rawProgress-v[0][0],v[1][0]))/100.0;
      break;
    case 22: // rawp between v[2] and v[4]
      energy = (min(rawProgress-v[2][0],v[3][0]-v[2][0]))/50.0;
      break;
    case 32:
      float mult = (rawProgress-v[4][0])/100.0+1;
      
      float speed = 3.0*mult;
      MAXSPEED.setValue(speed);
      //println(MAXSPEED.getValue());
      break;
    default:
      energy = 1.0;
    break;
  }
  //println(energy + " " + matterState);
  
  
  stroke(0);
  strokeWeight(5);
  
  for(int i=0; i<v.length-1; i++) {
    noFill();
    if(i!=0)ellipse(v[i][0],v[i][1],10,10);
    line(v[i][0],v[i][1],v[i+1][0],v[i+1][1]);
  }
  stroke(0,0,230);
  line(rawProgress,v[0][1],rawProgress,v[5][1]);
  
  stroke(100);
  line(v[0][0],v[5][1]-20,v[0][0],v[0][1]+20);//vertical
  
  
  line(v[0][0]-20,v[0][1],v[5][0]+20,v[0][1]);//horizonal
  
  textSize(20);
  fill(200,0,0);
  text("Time",v[5][0]+25,v[0][1]);
  text("Temperature",v[0][0]-20,v[5][1]-25);
  
  
  text("Solid",v[0][0]+30,v[0][1]-10);
  text("Melting",v[1][0]+50,v[1][1]-15);
  text("Freezing",v[1][0]+50,v[1][1]+25);
  
  text("Liquid",v[2][0]+30,v[2][1]);
  text("Boiling",v[3][0]+50,v[3][1]-15);
  text("Condensation",v[3][0]+50,v[3][1]+25);
  text("Gas",v[4][0]+30,v[4][1]);
  
  textSize(14);
  text("The cooling curve is the heating curve with the time reversed",40,670);
  
  strokeWeight(2);

}

int nextY() {
  GUICount++;
  return GUICount*15;
}

int nextY(int offset) {
  lastObj+=offset;
  return lastObj;
}

void timedTransition(float length, int nextState) {
  ST.setValue(ST.getValue() - 1.0/length);
  if (ST.getValue() < 1) {
    matterState = nextState;
    //println(matterState);
    ST.setValue(100);
  }
}

void spur(float mag) {
  flock.spur(mag);
}

void updateState() { //1 = solid final 11 = transition 12 = transition 22 = liquid 32 = gas
  //println("state is " + matterState);
  switch(matterState) {
    case 11:
      timedTransition(1, 1);
      break;
    case 12:
      timedTransition(.6, 11);
      break;
    default:
    break;
  }
  if(prevState != matterState) {
    ST.setValue(100);
    if(matterState == 32) {
      spur(10.0);
      flock.minVel(2.0);
    }
    else {
      flock.minVel(0.0);
    }
    switch(matterState) {
    case 1:
      MAXFORCE.setValue(.05);
      MAXSPEED.setValue(.05);
      NEIGHBORHOOD.setValue(500);
      ALICONST.setValue(2);
      SEPCONST.setValue(2);
      COHCONST.setValue(2);
      DESIREDSEPARATION.setValue(40);
      break;
    case 11:
      MAXFORCE.setValue(.2);
      MAXSPEED.setValue(2);
      NEIGHBORHOOD.setValue(1000);
      ALICONST.setValue(2);
      SEPCONST.setValue(10);
      COHCONST.setValue(2);
      DESIREDSEPARATION.setValue(35);
      break;
    case 12:
      timedTransition(.6, 11);
      MAXFORCE.setValue(1);
      MAXSPEED.setValue(4.0);
      NEIGHBORHOOD.setValue(1000);
      ALICONST.setValue(1.0);
      SEPCONST.setValue(10);
      COHCONST.setValue(5);
      DESIREDSEPARATION.setValue(25);
      break;
    case 22:
      MAXSPEED.setValue(2);
      MAXFORCE.setValue(.1);
      NEIGHBORHOOD.setValue(300);
      ALICONST.setValue(.2);
      SEPCONST.setValue(3);
      COHCONST.setValue(2);
      DESIREDSEPARATION.setValue(80);
      break;
    case 32:
      MAXSPEED.setValue(4);
      MAXFORCE.setValue(1);
      NEIGHBORHOOD.setValue(500);
      ALICONST.setValue(0);
      SEPCONST.setValue(10);
      COHCONST.setValue(0);
      DESIREDSEPARATION.setValue(40);
      
      break;
    default:
    }
  }
  prevState = matterState;
}
// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>

// The "Boid" class

// Created 2 May 2005

class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  PVector accOld;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  
  float desiredSeparation;
  
  float neighborDist;
  ArrayList<Boid> neighbors;
  
  float sepConst,aliConst,cohConst;
  
  float minVelocity;
    
  Boid(PVector l, float ms, float mf) {
    acc = new PVector(0,0);
    accOld = new PVector(0,0);
    vel = new PVector(0,0);
    loc = l.get();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    neighborDist = 100;
    
    sepConst = 2.0;
    aliConst = 1.0;
    cohConst = 1.0;
    
    neighbors = new ArrayList<Boid>();
  }
  
  void minVel(float min) {
    minVelocity = min;
  }
  
  void parameters() {
    maxforce = MAXFORCE.getValue()*energy;
    maxspeed = MAXSPEED.getValue();
    
    neighborDist = NEIGHBORHOOD.getValue();
    
    desiredSeparation = DESIREDSEPARATION.getValue();
    
    sepConst = SEPCONST.getValue();
    aliConst = ALICONST.getValue();
    cohConst = COHCONST.getValue();
  }
  
  void run() {
    parameters();    
    flock();
    update();
    //borders();
    render();
  }
  
  void addRandomVelocity(float mag) {
    PVector ran = new PVector(random(mag)-mag/2.0,random(mag)-mag/2.0,0);
    vel.add(ran);
  }
  
  void flock() {
    PVector sep = separate();   // Separation
    PVector ali = align();      // Alignment
    PVector coh = cohesion();   // Cohesion
    PVector avd = avoidWalls();
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
    
    stroke(255,0,0);
    if(drawAcc) line(loc.x,loc.y,loc.x+acc.x*200,loc.y+acc.y*200);
  }
  // Method to update location
  void update() {        
    // lowpass filter
    acc = PVector.add(PVector.mult(acc,0.9),PVector.mult(accOld,0.1));
    
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    if(minVelocity>0) {
      if(vel.mag()<minVelocity) {
        vel.normalize();
        vel.mult(minVelocity);
      }
    }
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
    PVector steer = new PVector(0,0,0);
    for(Boid neighbor:neighbors) {
      steer.add(neighbor.loc);
    }
    if(neighbors.size()>0) {
      steer.div(neighbors.size());
      return steerTo(steer,false);
    }
    return steer;
  }
  
  PVector align() {
    PVector steer = new PVector(0,0,0);
    for(Boid neighbor:neighbors) {
      PVector otherVel = neighbor.vel.get();
      steer.add(otherVel);
    }
    if(neighbors.size()>0) steer.div(neighbors.size());
    if(steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }
  
  PVector separate() { //returns desired steering vector
    PVector steer = new PVector(0,0,0);
    for(Boid neighbor:neighbors) {
      PVector relative = PVector.sub(loc,neighbor.loc);
      float distance = relative.mag();
      if(distance < desiredSeparation) {
        relative.normalize();
        
        relative.div(distance); 
        steer.add(relative);
      }
    }
    // raynalds steering = desired - vel
    if(steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }
  
  PVector avoidWalls() {
    PVector steer = new PVector(0,0,0);
    
    float desiredOffset = 20;
    
    if(loc.x < desiredOffset) steer.x = 1;
    if(loc.x > width-desiredOffset) steer.x = -1;
    if(loc.y < desiredOffset) steer.y = 1;
    if(loc.y > height-desiredOffset) steer.y = -1;
    
    if(steer.mag()>0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce*10);
    }
    return steer;
  }
  
  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steerTo(PVector target, boolean slowdown) {
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
    } else {
      steer = new PVector(0,0);
    }
    return steer;
  }
  
  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + radians(90);
    
    fill(175);
    stroke(0);
    pushMatrix();
      translate(loc.x,loc.y);
      rotate(theta);
      ellipse(0,0,15,15);
      ellipse(10,7,10,10);
      ellipse(-10,7,10,10);
      /*
      beginShape(TRIANGLES);
        vertex(0, -r*2);
        vertex(-r, r*2);
        vertex(r, r*2);
      */
      endShape();
      noFill();
      if(drawNeighborhood) ellipse(0,0,neighborDist*2,neighborDist*2);
      if(drawVel) {
        stroke(0,255,0);
        line(0,0,0,-vel.mag()*12);
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
/*
PVector separation_old() { //returns desired steering vector
    PVector v = new PVector(0,0,0);
    for(Boid neighbor:neighbors) {
      PVector relative = PVector.sub(neighbor.loc,loc);
      v.add(relative);
    }
    v.x = -v.x;
    v.y = -v.y;
    
    float distance = v.mag();
    distance = distance / neighborDist;
    
    float seperationPower = separationConst/distance;
    //println("sep power: " + seperationPower);
    
    v.normalize();
    v.mult(seperationPower);
    //println("steer vector: " + v);
    v.add(loc);
    return steer(v,false);
  }
  
  PVector cohesion() {
    PVector COG = new PVector(0,0);
    for(Boid neighbor:neighbors) {
      COG.add(neighbor.loc);
    }
    COG.div(neighbors.size());
    println(COG);
    
    return steer(COG,false);
  }
*/
class Flock {
  ArrayList<Boid> boids;
  
  Flock(int n) {
    boids = new ArrayList<Boid>();
    
    for(int i=0; i<n; i++) {
      addBoid(false);
      boids.get(i).vel = new PVector(random(-2.0,2.0),random(-2.0,2.0),0);
    }
  }
  
  void spur(float mag) {
    for(Boid boid:boids) {
      boid.addRandomVelocity(mag);
    }
  }
  
  void minVel(float min) {
    for(Boid boid:boids) {
      boid.minVel(min);
    }
  }
  
  void addBoid(boolean atMouse) {
    PVector loc;
    if(atMouse) loc = new PVector(mouseX,mouseY);
    else loc = new PVector(random(width),random(height));
    boids.add(new Boid(loc,4.0,.1));
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
    //println();
  }  
}
class ValueObject {
  float value;
  ValueObject() {
    value = 2.0; 
  }
  ValueObject(float v) {
    value = v;
  }
  void setValue(float v) {
    value = v;
  }
  float getValue() {
    return value;
  }
}
  


