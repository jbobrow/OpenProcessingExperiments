
ArrayList critters;
ArrayList DeadCritters;
float xPosDeadzone;
int maxNumberOfCritters = 8;

float startPositions = {0.25, 0.5, 0.75, 0.1, 0.3, 0.6};
int nextStartPosIndex = 0;


void setup() {
  size(480, 480);  
  deadZoneStartYPos = height * 0.95;
  deadZoneHeight = height * 0.05;
  
  critters = new ArrayList();
  deadCritters = new ArrayList();
    
  critters.add(new Critter(width*0.2,height*0.25));
  for (i = 0; i < 500; i++) {
    evolve((Critter)critters.get(0));
  }
  
  critters.add(new Critter(width*0.4,height*0.25));
  for (i = 0; i < 500; i++) {
    evolve((Critter)critters.get(1));
  }
  
  critters.add(new Critter(width*0.6,height*0.25));
  for (i = 0; i < 500; i++) {
    evolve((Critter)critters.get(2));
  }
  
  critters.add(new Critter(width*0.8,height*0.25));
  for (i = 0; i < 500; i++) {
    evolve((Critter)critters.get(3));
  }  
}

void draw() {  
  background(100,200,200); 
  // deadzone
  fill(0);
  rect(0, deadZoneStartYPos, width, deadZoneHeight);
  
 
  for (int i= critters.size()-1; i >= 0; i--) {
    Critter critter = (Critter) critters.get(i);
    critter.walk();
    critter.render();
    if (critter.isDead()) {
      // move to rotting
      deadCritters.add(critter);
      critters.remove(i);
    }
  } 
  
  for (int i= deadCritters.size()-1; i >= 0; i--) {
    Critter critter = (Critter) deadCritters.get(i);
    critter.rot();
    critter.render();
    if (critter.isRotted()) {
      deadCritters.remove(i);      
    }
  }   
}

float getNextStartPosition() {
  float pos = startPositions[nextStartPosIndex];
  if (nextStartPosIndex == (startPositions.length-1)) {
    nextStartPosIndex == 0;
  } else {
    nextStartPosIndex += 1;
  }
  return pos;
}


void evolve(Critter critter) {
  changeBy = 1;
  if (random(100) < 30) {
    changeBy *= -1;
  }
  
  for (int i=0; i < critter.maxCounts.length; i++) {
    if (random(100) < 10) {
      changeBy *= -1;
      critter.maxCounts[i] += changeBy;
      
      // max and min check
      if (critter.maxCounts[i] < 1) { critter.maxCounts[i] = 1; }
      if (critter.maxCounts[i] > 6) { critter.maxCounts[i] = 6; }
    }
  }
  
  for (int i=0; i < critter.angles.length; i++) {
    if (random(100) < 10) {
      changeBy *= -1;
      critter.angles[i] += changeBy;
      
      // max and min check
      if (critter.angles[i] < 1)   { critter.angles[i] = 1; }
      if (critter.angles[i] > 180) { critter.angles[i] = 180; }
    }
  }
  
  for (int i=0; i < critter.lengths.length; i++) {
    if (random(100) < 10) {      
      changeBy *= -1;
      critter.lengths[i] += changeBy;
      
      // max and min check
      if (critter.lengths[i] < 10) { critter.lengths[i] = 10; }
      if (critter.lengths[i] > 60) { critter.lengths[i] = 60; }
    }
  }
  
  for (int i=0; i < critter.ratios.length; i++) {
    if (random(100) < 10) {
      changeBy *= -1;
      critter.ratios[i] += (changeBy * 0.1);
      
      // max and min check
      if (critter.ratios[i] < 0.1) { critter.ratios[i] = 0.1; }
      if (critter.ratios[i] > 0.8) { critter.ratios[i] = 0.8; }
    }
  }
}


// assign 'genes' from the parents
Critter mate(Critter parentA, Critter parentB) {
  Critter child = new Critter(width*getNextStartPosition(), height*0.1);
  
  for (int i=0; i < child.maxCounts.length; i++) {
    child.maxCounts[i] = (random(2) < 1) ? parentA.maxCounts[i] : parentB.maxCounts[i];
  }
  
  for (int i=0; i < child.angles.length; i++) {
    child.angles[i] = (random(2) < 1) ? parentA.angles[i] : parentB.angles[i];
  }
  
  for (int i=0; i < child.lengths.length; i++) {
    child.lengths[i] = (random(2) < 1) ? parentA.lengths[i] : parentB.lengths[i];
  }
  
  for (int i=0; i < child.ratios.length; i++) {
    child.ratios[i] = (random(2) < 1) ? parentA.ratios[i] : parentB.ratios[i];    
  }
  
  evolve(child);
  
  return child;
}


class Critter {
  PVector location;
  PVector noff;
  
  float maxSize;
  BranchingThing legs0;
  BranchingThing legs1;
  BranchingThing legs2;
  BranchingShapeThing body3;
  BranchingShapeThing body4;
  
  boolean alive = true;
  boolean rotted = false;
  int lifeColour = 255;
  int mateTimeout = 0;
  
  int[]   maxCounts = { 1, 1, 2, 1, 1 }; // 1 - 6
  float[] angles    = { 20, 20, 10, 20, 10 }; // 1- 180
  float[] lengths   = { 20, 20, 20, 20, 20 }; // 10 - 60
  float[] ratios    = { 0.5, 0.5, 0.5, 0.3, 0.6 }; // 0.1 - 0.8
  
  float rotation = 0;
  float xBias = 0.25;
    
  Critter(float x, float y) {   
    // adjust size based on canvas size so enough critters fit on the screen
    if (width <= height) {
      maxSize = width * 0.2;
    } else {
      maxSize = width * 0.2;
    };
    
    if (random(2) < 1) {
      xBias *= -1;
    }
    
    location = new PVector(x, y);
    noff = new PVector(random(5000),random(5000));    
  }
  
  boolean isDead() {
    return !alive;
  }
  
  boolean isRotted() {
    return rotted;
  }
  
  void render() { 
    legs0 = new BranchingThing(maxCounts[0], angles[0], lengths[0], ratios[0], maxSize, lifeColour);
    legs1 = new BranchingThing(maxCounts[1], angles[1], lengths[1], ratios[1], maxSize, lifeColour);    
    legs2 = new BranchingThing(maxCounts[2], angles[2], lengths[2], ratios[2], maxSize, lifeColour);       
    body3 = new BranchingShapeThing(maxCounts[3], angles[3], lengths[3], ratios[3], maxSize, lifeColour);
    body4 = new BranchingShapeThing(maxCounts[4], angles[4], lengths[4], ratios[4], maxSize, lifeColour);
    
    pushMatrix();      
      translate(location.x,location.y);
      rotate(radians(rotation));      
      legs0.startBranching();
      pushMatrix();
        rotate(radians(180));
        legs1.startBranching();      
        body3.startBranching();
        stroke(lifeColour);
        line(0,10);
        noStroke(0);
        translate(0,10);
        legs2.startBranching();
        body4.startBranching();      
      popMatrix();
    popMatrix();      
  }
  
  void rot() {    
    totalLengths = 0;    
    
    for (int i=0; i < this.angles.length; i++) {
      this.angles[i] -= 0.05;
    }
    
    for (int i=0; i < this.lengths.length; i++) {
      this.lengths[i] -= 0.05;
      totalLengths += this.lengths[i];
    }
    
    if (lifeColour > 0) {
      lifeColour--;
    }
    
    location.y += 0.05; // sink into the oil
    
    if ((lifeColour <= 0) && (totalLengths <= 0)) {
      rotted = true;
    }    
  }
  
  void walk() {    
    
    // dead zone collision
    if (location.y > deadZoneStartYPos) {
      alive = false;
    }                
    
    if (alive) {
      if (mateTimeout > 0) {
        mateTimeout--;
      }
      
      // critter collisions
      Critter offSpring = null;
      for (int i = 0; i < critters.size(); i++) {
        Critter critterToCompare = (Critter) critters.get(i);
        if (critterToCompare != this) { // don't compare to self!      
          float d = this.location.dist(critterToCompare.location);      
          if (d < 10) {
            if (critters.size() < maxNumberOfCritters) {
              if (mateTimeout == 0) {
                // can mate again
                offSpring = mate(critterToCompare, this);
                mateTimeout = 1000;
              }
              critterToCompare.xBias *= -1;
              this.xBias *= -1;
            }
          }      
        }
      }    
      
      if (offSpring) {
        critters.add(offSpring);
      }
    
      location.x += map(noise(noff.x),0,1,-1+xBias,1+xBias);
      location.y += map(noise(noff.y),0,1,-1,1.5); // slight tendency to move down the screen
      
      if(location.x < 10) { 
        location.x = 11; 
        xBias *= -1; // flip x direction
      }
      if(location.x > (width-10)) { 
        location.x = (width-11); 
        xBias *= -1; // flip x direction 
      }
      if(location.y < 10) { location.y = 11; }
      if(location.x > (height-10)) { location.y = (height-11); }        
      
      speed = 0.010 - map(this.lengths[3],10,60,0,0.006); 
      noff.add(speed,speed);
      
      // very occassionally, just change direction
      if (random(500) < 1) {
        xBias *= -1; // flip x direction
      }
      
      rotation += (random(2) < 1) ? map(noise(noff.x),0,1,-1,1) : map(noise(noff.y),0,1,-2,2);;
    }
  }
  
}


// Branchy 'leggy' things
class BranchingThing {
  int   branchingDepthMaxCount; 
  int   bwShade = 255;
  float branchingAngle, 
        branchingLengthInitial, 
        branchRatio; 
        
  float branchingLengthMin = 2;
  float branchingTotalLengthMax;
  
  // default new state
  BranchingThing(float maxSize) {
    branchingDepthMaxCount = 1;
    branchingAngle = 42;
    branchingLengthInitial = 30;
    branchRatio = 0.1;
    branchingTotalLengthMax = maxSize;
  }
  
  BranchingThing(int iDepth,
                   float fAngle, 
                   float fLength,
                   float fRatio,
                   float maxSize,
                   int iBwShade) {
    branchingDepthMaxCount = iDepth;
    branchingAngle = radians(fAngle);     
    branchingLengthInitial = fLength;
    branchRatio = fRatio; 
    branchingTotalLengthMax = maxSize;
    bwShade = iBwShade; 
  }
  
  void startBranching() {    
    stroke(bwShade);
    branch(branchingLengthInitial, branchingDepthMaxCount, branchingLengthInitial);
  }
 
  void branch(float h, int maxDepth, float totalLength) {
    h *= branchRatio;    
    totalLength += h;    
    maxDepth -= 1;
    
    // recursion exit conditions
    if ((h > branchingLengthMin) && (maxDepth >= 0) && (totalLength <= branchingTotalLengthMax)) {
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
        rotate(branchingAngle);   // Rotate by theta
        line(0, 0, 0, -h);  // Draw the branch
        translate(0, -h); // Move to the end of the branch
        branch(h, maxDepth, totalLength);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
      
      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix();
        rotate(-branchingAngle);
        line(0, 0, 0, -h);
        translate(0, -h);
        branch(h, maxDepth, totalLength);
      popMatrix();
    }
  }
}


// Branchy 'shape' things
class BranchingShapeThing {
  int   branchingDepthMaxCount; 
  int   bwShade = 255;
  float branchingAngle,
        branchingLengthInitial, 
        branchRatio; 
        
  float branchingLengthMin = 2;
  float branchingTotalLengthMax;
  
  BranchingShapeThing(float maxSize) {
    branchingDepthMaxCount = 2;
    branchingAngle = 2;
    branchingLengthInitial = 10;
    branchRatio = 0.5;
    branchingTotalLengthMax = maxSize;
  }
  
  BranchingShapeThing(int iDepth,                   
                   float fAngle, 
                   float fLength,
                   float fRatio,
                   float maxSize,
                   int iBwShade) {
    branchingDepthMaxCount = iDepth;
    bwShade = 255;
    branchingAngle = radians(fAngle);     
    branchingLengthInitial = fLength;
    branchRatio = fRatio;  
    branchingTotalLengthMax = maxSize;
    bwShade = iBwShade;
  }
  
  void startBranching() {    
    noStroke();
    fill(bwShade);
    branch(branchingLengthInitial, branchingDepthMaxCount, branchingLengthInitial);
  }
 
  void branch(float h, int maxDepth, float totalLength) {
    h *= branchRatio;    
    totalLength += h;    
    maxDepth -= 1;
    
    // recursion exit conditions
    if ((h > branchingLengthMin) && (maxDepth >= 0) && (totalLength <= branchingTotalLengthMax)) {
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
        rotate(branchingAngle);   // Rotate by theta
        ellipse(0, 0, h, h);  // Draw the branch
        translate(0, -h/2); // Move to the end of the branch
        branch(h, maxDepth, totalLength);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
      
      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix();
        rotate(-branchingAngle);
        line(0, 0, 0, -h);
        translate(0, -h/2);
        branch(h, maxDepth, totalLength);
      popMatrix();
    }
  }
}


