
Critter critterA;
Critter critterB;
Critter critterC;
Critter critterD;

void setup() {
  size(480, 480);  
  //frameRate(1);
  critterA = new Critter(width*0.5,height*0.5);
}

void draw() {  
  background(100,200,200);  
  
  critterA.walk();
  evolve(critterA);  
  critterA.render();  
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
  Critter child = new Critter();
  
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
  
  int[]   maxCounts = { 1, 1, 2, 1, 1 }; // 1 - 6
  float[] angles    = { 20, 20, 10, 20, 10 }; // 1- 180
  float[] lengths   = { 20, 20, 20, 20, 20 }; // 10 - 60
  float[] ratios    = { 0.5, 0.5, 0.5, 0.3, 0.6 }; // 0.1 - 0.8
  
  float rotation = 0;
    
  Critter(float x, float y) {   
    // adjust size based on canvas size so enough critters fit on the screen
    if (width <= height) {
      maxSize = width * 0.2;
    } else {
      maxSize = width * 0.2;
    };
    
    location = new PVector(x, y);
    noff = new PVector(random(1200),random(800));    
  }
  
  void render() { 
    legs0 = new BranchingThing(maxCounts[0], angles[0], lengths[0], ratios[0], maxSize);
    legs1 = new BranchingThing(maxCounts[1], angles[1], lengths[1], ratios[1], maxSize);    
    legs2 = new BranchingThing(maxCounts[2], angles[2], lengths[2], ratios[2], maxSize);       
    body3 = new BranchingShapeThing(maxCounts[3], angles[3], lengths[3], ratios[3], maxSize);
    body4 = new BranchingShapeThing(maxCounts[4], angles[4], lengths[4], ratios[4], maxSize);
    
    pushMatrix();      
      translate(location.x,location.y);
      rotate(radians(rotation));      
      legs0.startBranching();
      pushMatrix();
        rotate(radians(180));
        legs1.startBranching();      
        body3.startBranching();
        stroke(255);
        line(0,10);
        noStroke(0);
        translate(0,10);
        legs2.startBranching();
        body4.startBranching();      
      popMatrix();
    popMatrix();      
  }
  
  void walk() {    
    location.x = map(noise(noff.x),0,1,0,width);
    location.y = map(noise(noff.y),0,1,0,height);
    
    noff.add(0.001,0.001,0);
    
    rotation += random(-2,2);
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
                   float maxSize) {
    branchingDepthMaxCount = iDepth;
    branchingAngle = radians(fAngle);     
    branchingLengthInitial = fLength;
    branchRatio = fRatio; 
    branchingTotalLengthMax = maxSize; 
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
                   float maxSize) {
    branchingDepthMaxCount = iDepth;
    bwShade = 255;
    branchingAngle = radians(fAngle);     
    branchingLengthInitial = fLength;
    branchRatio = fRatio;  
    branchingTotalLengthMax = maxSize;
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


