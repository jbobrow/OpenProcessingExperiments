
Critter critterA;
Critter critterB;
Critter critterC;
Critter critterD;

void setup() {
  size(480,800);  
  frameRate(1);
  
}

void draw() {  
  background(100,200,200);
  
  // Set start position
  pushMatrix();
  translate(width*0.25,height*0.25); 
  critterA = new Critter();
  critterA.render();
  popMatrix();
  
  pushMatrix();
  translate(width*0.75,height*0.25); 
  critterB = new Critter();
  critterB.render();
  popMatrix();
  
  pushMatrix();
  translate(width*0.25,height*0.75); 
  critterC = new Critter();
  critterC.render();
  popMatrix();
  
  pushMatrix();
  translate(width*0.75,height*0.75); 
  critterD = new Critter();
  critterD.render();
  popMatrix();
  
}

class Critter {
  BranchingThing legsA;
  BranchingThing legsB;
  BranchingThing legsC;
  BranchingShapeThing bodyA;
  BranchingShapeThing bodyB;
  
  Critter() {
    legsA = new BranchingThing((int)random(1,6),255,random(1,90),random(30,60),random(0.1,0.8));
    legsB = new BranchingThing((int)random(1,6),255,random(1,90),random(30,60),random(0.1,0.8));    
    legsC = new BranchingThing((int)random(1,6),255,random(1,90),random(30,60),random(0.1,0.8));       
    bodyA = new BranchingShapeThing((int)random(2,5),255,random(1,180),random(10,60),random(0.2,0.7));
    bodyB = new BranchingShapeThing((int)random(2,5),255,random(1,180),random(10,60),random(0.2,0.7));
  }
  
  void render() {    
    legsA.startBranching();
    pushMatrix();
      rotate(radians(180));
      legsB.startBranching();      
      bodyA.startBranching();
      stroke(255);
      line(0,10);
      noStroke(0);
      translate(0,10);
      legsC.startBranching();
      bodyB.startBranching();      
    popMatrix();
  }
  
}


// Branchy 'leggy' things
class BranchingThing {
  int   branchingDepthMaxCount,
        bwShade;
  float branchingAngle, 
        branchingLengthInitial,
        branchRatio;
        
  float branchingLengthMin = 2;
  float branchingTotalLengthMax = 100;
  
  BranchingThing(int iDepth,
                   int iShade, 
                   float fAngle, 
                   float fLength,
                   float fRatio) {
    branchingDepthMaxCount = iDepth;
    bwShade = iShade;
    branchingAngle = radians(fAngle);     
    branchingLengthInitial = fLength;
    branchRatio = fRatio;  
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
  int   branchingDepthMaxCount,
        bwShade;
  float branchingAngle, 
        branchingLengthInitial,
        branchRatio;
        
  float branchingLengthMin = 2;
  float branchingTotalLengthMax = 100;
  
  BranchingShapeThing(int iDepth,
                   int iShade, 
                   float fAngle, 
                   float fLength,
                   float fRatio) {
    branchingDepthMaxCount = iDepth;
    bwShade = iShade;
    branchingAngle = radians(fAngle);     
    branchingLengthInitial = fLength;
    branchRatio = fRatio;  
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


