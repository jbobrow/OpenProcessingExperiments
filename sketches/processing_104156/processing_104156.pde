
ArrayList critters;
ArrayList deadCritters;
float deadZoneStartYPos;
int maxNumberOfCritters = 8;

float startPositions = {0.25, 0.5, 0.75, 0.1, 0.4, 0.8};
int nextStartPosIndex = 0;

int bgR = 100;
int bgG = 200;
int bgB = 200;

boolean nearestCritterPicked = false;
int nearestCritterArrayPos = -1;

boolean isPlaying = false;
boolean hasEnded = false;

float dyingFiller;
PFont fCourier;
PFont fCourierSmall;

// audio
//Maxim maxim;
//AudioPlayer song1, song2, song3, song4, song5, song6, song7, song8;

void setup() {
  // fonts
  fCourier = createFont("Courier New Bold", 30, true);
  fCourierSmall = createFont("Courier New", 20, true);
  // audio
//  maxim = new Maxim(this);
//  song1 = maxim.loadFile("song1.wav");
//  song2 = maxim.loadFile("song2.wav");
//  song3 = maxim.loadFile("song3.wav");
//  song4 = maxim.loadFile("song4.wav");
//  song5 = maxim.loadFile("song5.wav");    
//  song6 = maxim.loadFile("song6.wav");
//  song7 = maxim.loadFile("song7.wav"); 
//  song8 = maxim.loadFile("song8.wav"); 
// 
//  song1.setLooping(true);
//  song2.setLooping(true);
//  song3.setLooping(true);
//  song4.setLooping(true);
//  song5.setLooping(true);
//  song6.setLooping(true);
//  song7.setLooping(true);
//  song8.setLooping(true);

  size(480, 800);  
  deadZoneStartYPos = height * 0.90;
  deadZoneHeight = height * 0.1;
  
  startNewGame();   
}

boolean thereIsCapacity() {
  if (critters.size() < maxNumberOfCritters) {
    return true;
  } else {
    return false;
  }
}

void startNewGame() {
  // reset this
  dyingFiller = deadZoneStartYPos;
  
  critters = new ArrayList();
  deadCritters = new ArrayList();
    
  critters.add(new Critter(width*0.2,height*0.25));    
  critters.add(new Critter(width*0.4,height*0.25));  
  critters.add(new Critter(width*0.6,height*0.25));  
  critters.add(new Critter(width*0.8,height*0.25));
  
  slightlyRandomStart();
}

void slightlyRandomStart() {
  for (i = 0; i < critters.size(); i ++) {
    Critter c = (Critter) critters.get(i);
    for (j = 0; j < 200; j++) {
      evolve(c);
    } 
  }  
}

void capacityDots() {
  float spacing = width / (maxNumberOfCritters);    
  pushMatrix();    
  fill(40);
  noStroke();
    translate((spacing/2), deadZoneStartYPos + (deadZoneHeight / 2));
    for (i = 0; i < maxNumberOfCritters; i++) {      
      if (i > (critters.size() - 1)) {
        fill(15);
      }
      ellipse(0,0, deadZoneHeight/4, deadZoneHeight/4);
      translate(spacing, 0);      
    }
  popMatrix();
}

void startScreen() {
  background(100,200,160);
  drawDeadZone();
  drawStartShape(); 

  textFont(fCourier); 
  textAlign(CENTER);
  text("DIGITAL HUSBANDRY", width/2, height*0.2);
  
  textFont(fCourierSmall);
  fill(255);
  text("KILLING TIME BREEDING CRITTERS", width/2, height*0.3);
  
  fill(0);
  text("Click to start. Drag to play.", width/2, height*0.7);
  fill(255);
  text("You decide when you win.", width/2, height*0.8);   
}

void deadScreen() {      
  background(bgR,bgG,bgB);
  fill(0);
  rect(0, dyingFiller, width, height-dyingFiller+1);
    
  if (dyingFiller > 0) {
    bgTendToRed();
    dyingFiller-=2;
  } else {
    drawSkull();
    
    textFont(fCourierSmall);
    fill(50);
    text("@adamlofting   adamlofting.com", width/2, height*0.8);
  }
}

void drawSkull() {
  fill(255);
  noStroke();
  pushMatrix();
    translate(width*0.5, height*0.5);
    ellipse(0, 0, width*0.1, width*0.1);       
    rect(-width*0.025, width*0.025, width*0.05, width*0.04);
    fill(0);
    ellipse(-width*0.015, 0, width*0.02, width*0.02);
    ellipse(width*0.015, 0, width*0.02, width*0.02);
  popMatrix();
}

void drawStartShape() {
  fill(255);
  noStroke();
  pushMatrix();
    translate(width*0.5, height*0.5);
    ellipse(0, 0, width*0.1, width*0.1);           
    fill(0);
    triangle(-width*0.015,-width*0.02,-width*0.015,width*0.02,width*0.02,0);    
  popMatrix();
}

void drawDeadZone(){
  // deadzone
  fill(0);
  noStroke();
  rect(0, deadZoneStartYPos, width, deadZoneHeight);    
}

void cueMusic() {
//  song1.volume(0);
//  song2.volume(0);
//  song3.volume(0);
//  song4.volume(0);
//  song5.volume(0);
//  song6.volume(0);
//  song7.volume(0);
//  song8.volume(0);
//  
//  song1.play();
//  song2.play();
//  song3.play();
//  song4.play();
//  song5.play();
//  song6.play();
//  song7.play();
//  song8.play(); 
}

void playMusic() {
  
//  cueMusic();   
//  
//  if (critters.size() == 1) {    
//    song1.volume(1);    
//  }
//  if (critters.size() == 2) {    
//    song2.volume(1);    
//  }
//  if (critters.size() == 3) {    
//    song3.volume(1);    
//  }
//  if (critters.size() == 4) {    
//    song4.volume(1);    
//  } 
//  if (critters.size() == 5) {    
//    song5.volume(1);    
//  } 
//  if (critters.size() == 6) {    
//    song6.volume(1);    
//  } 
//  if (critters.size() == 7) {    
//    song7.volume(1);    
//  } 
//  if (critters.size() == 8) {    
//    song8.volume(1);    
//  } 
}

void draw() {  
  if (hasEnded) {
    deadScreen();
  } else if (isPlaying) {
    
    //playMusic();
    
    background(bgR,bgG,bgB);        
    drawDeadZone();    
    
    // target line
    if (nearestCritterPicked) {             
      PVector mouse  = new PVector(mouseX,mouseY);
      PVector nearestLoc = (Critter)critters.get(nearestCritterArrayPos).location;
      PVector circleLine = new PVector(nearestLoc.x,nearestLoc.y);
      float lenghtOfCircleLine = mouse.dist(nearestLoc);
      float cicleSpacing = 15;
      int numberOfCirclesInLine = (int) lenghtOfCircleLine / 15;
      mouse.sub(nearestLoc);
      mouse.normalize();
      mouse.mult(15);
      pushMatrix();        
        //translate(nearestLoc.x, nearestLoc.y);
        fill(bgR*0.7,bgG*0.7,bgB*0.7);      
        for (int i = 0; i <= numberOfCirclesInLine; i++) {        
          ellipse(circleLine.x, circleLine.y, 3, 3);
          circleLine.add(mouse);
        }
      popMatrix();
    } 
   
    for (int i= critters.size()-1; i >= 0; i--) {
      Critter critter = (Critter) critters.get(i);
      critter.walk();
      critter.render();
      if (critter.isDead()) {
        // move to rotting
        deadCritters.add(critter);
        nearestCritterPicked = false; // re-pick to avoid array complications
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
    
    if (critters.isEmpty() && deadCritters.isEmpty()) {
      hasEnded = true;
    }
  } else {
    // ready to play
    startScreen();
    cueMusic(); 
  }  
  
  capacityDots();
   
}

void mouseClicked() {
  if (hasEnded) {
    // restart the game
    hasEnded = false;
    isPlaying = false;
  } else if (!isPlaying) {
    startNewGame(); 
    isPlaying = true;
  }
}

void mouseDragged() {    
  if (isPlaying) {
    if (!nearestCritterPicked) {
      PVector mousePosVector = new PVector(mouseX,mouseY);    
      nearestCritterArrayPos = 0;
      float lowestScore = width + height; // anything bigger than actual max will do
      for (int i = 0; i < critters.size(); i++) {
        Critter c = (Critter) critters.get(i); 
        if (c) {
          float d = c.location.dist(mousePosVector);      
          if (d < lowestScore) {
            lowestScore = d;
            nearestCritterArrayPos = i;
          }
        }
      }    
      nearestCritterPicked = true;    
    }  
  }
}

void tweakBG() {
  if (random(3) < 1) {
    bgR = tweakIndividualColour(bgR);
  }
  if (random(3) < 1) {
    bgG = tweakIndividualColour(bgG);
  }
  if (random(3) < 1) {
    bgB = tweakIndividualColour(bgB);
  }
}

void bgTendToRed() {
  bgR = towards255(bgR);
  bgG = awayFrom255(bgG);
  bgB = awayFrom255(bgB);
}

int towards255(int i) {
  if (i < 255) {
    i++;
  }
  return i;
}

int awayFrom255(int i) {
  if (i > 0) {
    i--;
  }
  return i;
}

int tweakIndividualColour(int i) {
  i += (int) random(-15,15);
  if (i > 210) {
    i = 210;
  }
  if (i < 30) {
    i = 30;
  }
  return i;
}

void mouseReleased() {
  nearestCritterPicked = false;
  if (nearestCritterArrayPos >= 0) {
    Critter c = (Critter) critters.get(nearestCritterArrayPos);    
    if (c) {
      c.target = new PVector(mouseX,mouseY);
      c.hasTarget = true;
    }
  }
}

float getNextStartPosition() {
  float pos = startPositions[nextStartPosIndex];
  if (nextStartPosIndex < startPositions.length) {
    nextStartPosIndex += 1;  
  } else {
      nextStartPosIndex = 0;
  }
  return pos;
}


void evolve(Critter critter) {
  changeBy = 1;
  if (random(100) < 1) {
    changeBy = 2;
  }
  if (random(100) < 25) {
    changeBy *= -1;
  }
  
  for (int i=0; i < critter.maxCounts.length; i++) {
    if (random(100) < 15) {
      changeBy *= -1;
      critter.maxCounts[i] += changeBy;
      
      // max and min check
      if (critter.maxCounts[i] < 1) { critter.maxCounts[i] = 1; }
      if (critter.maxCounts[i] > 6) { critter.maxCounts[i] = 6; }
    }
  }
  
  for (int i=0; i < critter.angles.length; i++) {
    if (random(100) < 20) {
      changeBy *= -1;
      critter.angles[i] += (changeBy * random(1,5));
      
      // max and min check
      if (critter.angles[i] < 1)   { critter.angles[i] = 1; }
      if (critter.angles[i] > 180) { critter.angles[i] = 180; }
    }
  }
  
  for (int i=0; i < critter.lengths.length; i++) {
    if (random(100) < 20) {      
      changeBy *= -1;
      critter.lengths[i] += (changeBy * random(1,5));
      
      // max and min check
      if (critter.lengths[i] < 10) { critter.lengths[i] = 10; }
      if (critter.lengths[i] > 60) { critter.lengths[i] = 60; }
    }
  }
  
  for (int i=0; i < critter.ratios.length; i++) {
    if (random(100) < 15) {
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
  tweakBG();
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
  int timeMating = 0;
  int mateShake = 5;
  boolean repelling = false;
  
  int[]   maxCounts = { 1, 1, 2, 1, 1 }; // 1 - 6
  float[] angles    = { 20, 20, 10, 20, 10 }; // 1- 180
  float[] lengths   = { 20, 20, 20, 20, 20 }; // 10 - 60
  float[] ratios    = { 0.5, 0.5, 0.5, 0.3, 0.6 }; // 0.1 - 0.8
  
  float rotation = 0;
  float xBias = 0.25;
  
  PVector target = new PVector(0,0);
  boolean hasTarget = false;
    
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
    this.noff = new PVector(random(5000),random(5000));    
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
      tweakBG();
    }                
    
    if (alive) {      
      
      // critter collisions
      Critter offSpring = null;
      for (int i = 0; i < critters.size(); i++) {
        Critter critterToCompare = (Critter) critters.get(i);
        if (critterToCompare != this) { // don't compare to self!      
          float d = this.location.dist(critterToCompare.location);      
          
          if (d < 12) { 
            // MATE
            if (critters.size() < maxNumberOfCritters) {                            
              if (this.timeMating > 60) {
                offSpring = mate(critterToCompare, this);                
                this.timeMating = -100; // acts as a timeout during repel
                critterToCompare.timeMating = -100; // prevents twins
                repel(critterToCompare, this);                
              } else {                
                this.timeMating++;
                this.rotation += this.mateShake;
                if ((this.timeMating % 5) == 0) {
                  this.mateShake *= -1;
                }
              }
              
              critterToCompare.xBias *= -1;
              this.xBias *= -1;
            } else {
              repel(this, critterToCompare);
            }
          } 
            
          if ((d < 30) && (!repelling) && thereIsCapacity()) {
            // ATTRACTION              
            this.target.x = critterToCompare.location.x;
            this.target.y = critterToCompare.location.y;
            this.hasTarget = true;                                    
          }       
        }
      }    
      
      if (offSpring) {
        critters.add(offSpring);
      }
    
      if (hasTarget) {
        // less variance and skip the xBias
        location.x += map(noise(noff.x),0,1,-0.2,0.2);
      } else {
        location.x += map(noise(noff.x),0,1,-1+xBias,1+xBias);
      }
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
      
      if (!hasTarget) {
        // very occassionally, just change direction
        if (random(500) < 1) {
          xBias *= -1; // flip x direction
        }
      }
      
      if (hasTarget) {
        if (random(10) < 8) {          
          PVector dir = PVector.sub(target,location);
          dir.normalize();
          dir.mult(1.5); 
          location.add(dir);
          
          if (location.dist(target) < 10) {
            hasTarget = false;
            repelling = false;
          }
        }
      }
      
      rotation += (random(2) < 1) ? map(noise(noff.x),0,1,-1,1) : map(noise(noff.y),0,1,-2,2);;
    }
  }
  
}

void repel(Critter critterA, Critter critterB) {
  critterA.repelling = true;
  critterB.repelling = true;
  x1 = random(20,40);
  y1 = random(20,40);
  x2 = random(20,40);
  y2 = random(20,40);
  critterA.target.x += x1;
  critterA.target.y += y1;
  critterB.target.x -= x2;
  critterB.target.y -= y2;
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


