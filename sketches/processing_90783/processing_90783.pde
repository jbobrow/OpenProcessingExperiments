
int testNumber;

PVector center;
boolean noLoop;
float   lenFactor;
float   lenAdjust;
boolean rightSide;
float   length;
float   angle;
int     counter;
float   factor;
boolean counterSwitch;
boolean factorSwitch;

void setup() {
  // There are 2 tests, numbered 1 and 2
  testNumber = 1;

  switch(testNumber) {
  case 1:
    setupRotatingAnimatedVectors();
    break;
  case 2:
    setupTreeStructure();
    break;
  default:
    setupRotatingAnimatedVectors();
    break;
  }
}

void draw() {
  switch(testNumber) {
  case 1:
    rotatingAnimatedVectors();
    break;
  case 2:
    treeStructure();
    break;
  default:
    rotatingAnimatedVectors(); 
    break;
  }
}

/* ****************** TEST 1 ******************** */
void setupRotatingAnimatedVectors() {
  size(800, 600);
  smooth(); 
  background(255);

  center    = new PVector(width/2, height/2);
  noLoop    = true;
  lenFactor = 0.5;
  lenAdjust = 0.01;
  rightSide = true;
  length    = 200;
  angle     = 0;
}

void rotatingAnimatedVectors() {
  background(255);

  // Make things rotate and move
  lenFactor += lenAdjust;
  if (lenFactor > 0.99 || lenFactor < 0.01) {
    lenAdjust *= -1;
    rightSide = !rightSide;
  }
  angle += 1;

  // Create the vector pack
  PVector        endVector  = positionWith(angle, length);
  PerpVectorPack pPack      = new PerpVectorPack(endVector, lenFactor, 0.15, rightSide);

  PVector ptOnLine = pPack.ptOnOriginalLine();
  PVector perpPt   = pPack.perpVectorPt();

  // Drawing code
  pushMatrix();
  translate(center.x, center.y);

  // Draw the lines
  stroke(150);
  line(0, 0, endVector.x, endVector.y);
  line(ptOnLine.x, ptOnLine.y, perpPt.x, perpPt.y);

  // Draw center point and end point
  noStroke();
  fill(255, 0, 0);
  ellipse(0, 0, 5, 5);
  ellipse(endVector.x, endVector.y, 5, 5);

  // Draw the point at the end of the perpendicular vector
  fill(0);
  ellipse(perpPt.x, perpPt.y, 3, 3);

  popMatrix();
}
/* ****************** END TEST 1 ******************** */

/* ****************** TEST 2 ******************** */
void setupTreeStructure() {
  size(800, 600);
  smooth(); 
  background(255);
  frameRate(10);

  center    = new PVector(width/2, height/2);
  noLoop    = false;
  rightSide = true;
  length    = 200;
  angle     = 270;
  counter   = 1;
  factor    = 0.1;

  counterSwitch = false;
  factorSwitch  = false;
}

void treeStructure() {

  if (!noLoop) {
    background(255);

    if (counter > 10 || counter < 1) counterSwitch = !counterSwitch;

    if (counterSwitch) {
      counter -= 1;
    } 
    else {
      counter += 1;
    }

    if (factor < 0 || factor > 0.1) factorSwitch = !factorSwitch;

    if (factorSwitch) {
      factor += 0.01;
    } 
    else {
      factor -= 0.01;
    }

    PVector        endVector  = positionWith(angle, length);
    PerpVectorPack pPack      = new PerpVectorPack(endVector);

    // Add a bunch of perpendicular lines
    for (int i = counter; i < (10 + counter); i++) {
      float dist = 1 - (factor * i);
      float mag  = (factor * i);
      if (dist <= 0 || mag <= 0) continue;
      pPack.addPerpVector(dist, mag - (noise(mag*4)*mag), true);
      pPack.addPerpVector(dist, mag - (noise(mag*4)*mag), false);
    }

    // Get the lines as ArrayLists
    ArrayList linePoints = pPack.pointsOnLine;
    ArrayList perpPoints = pPack.perpVectorPoints;

    // Drawing Code
    pushMatrix();
    translate(center.x, center.y);

    // Draw the main line
    noFill();
    stroke(180);
    line(0, 0, endVector.x, endVector.y);


    // Draw the perpendicular lines
    for (int i = 0; i < linePoints.size(); i++) {
      PVector linePt = (PVector)linePoints.get(i);
      PVector perpPt = (PVector)perpPoints.get(i);
      if(i%2 == 0){
        stroke(255,0,0);
      } else {
        stroke(0,0,255);
      }
      line(linePt.x, linePt.y, perpPt.x, perpPt.y);
    }


    popMatrix();

    //noLoop = true;
  }
}

/* ****************** END TEST 2 ******************** */


/* ****************** SUPPORT FUNCTIONS ******************** */

void mouseClicked() {
  noLoop = !noLoop;
}

// Utility Function for finding the end of the line, given the angle
PVector positionWith(float angle, float length) {
  float x = cos(radians(angle)) * length;
  float y = sin(radians(angle)) * length;
  return new PVector(x, y);
}
/* ****************** END SUPPORT FUNCTIONS ******************** */

class PerpVectorPack {
  // Store the original data
  PVector originalVector;

  // Keep track of values used to calculate points
  ArrayList<Float>   percentOfOriginalVector;
  ArrayList<Float>   magnitudeOfPerpendicularVector;
  ArrayList<Boolean> onRightSide;

  // Storage of calculated perpendicular line points
  ArrayList pointsOnLine;
  ArrayList perpVectorPoints;


  // Constructors
  PerpVectorPack(PVector origVector) {
    initializeLists();
    originalVector = origVector.get();
  }

  PerpVectorPack(PVector origVector, float perpVectDist, float perpVectMag, boolean rightSide) {    
    initializeLists();
    originalVector = origVector.get();
    addPerpVector(perpVectDist, perpVectMag, rightSide);
  }

  private void initializeLists() {
    pointsOnLine                    = new ArrayList();
    perpVectorPoints                = new ArrayList();

    percentOfOriginalVector         = new ArrayList<Float>();
    magnitudeOfPerpendicularVector  = new ArrayList<Float>();
    onRightSide                     = new ArrayList<Boolean>();
  }


  // Methods
  public void addPerpVector(float perpVectDist, float perpVectMag, boolean rightSide) {

    // Keep track of the values used to create the perpendicular points
    percentOfOriginalVector.add(perpVectDist);
    magnitudeOfPerpendicularVector.add(perpVectMag);
    onRightSide.add(rightSide);

    PVector full    = originalVector.get();
    float   fullMag = full.mag();

    // Determine where along the original vector the perpendicular vector should lie (lay?)
    full.normalize();
    full.mult(perpVectDist * fullMag);

    // Set the first local variable
    pointsOnLine.add(full.get());

    // Get the normal of the original full vector and normalize it
    PVector perpVector  = new PVector(-originalVector.y, originalVector.x);
    perpVector.normalize();

    // Determine if it should be on the right or left side of the original vector
    int dir = 1;
    if (!rightSide) dir = -1;

    // Make it the proper length
    perpVector.mult(fullMag * perpVectMag * dir);

    // Offset it from the origin
    perpVector.add(full);

    // Set the second local variable
    perpVectorPoints.add(perpVector.get());
  }

  public PVector ptOnOriginalLine() { 
    return ptOnOriginalLine(0);
  };
  
  public PVector ptOnOriginalLine(int idx) {
    PVector thePoint = (PVector)pointsOnLine.get(idx);
    return thePoint.get();
  }

  public PVector perpVectorPt() { 
    return perpVectorPt(0);
  };
  
  public PVector perpVectorPt(int idx) {
    PVector thePoint = (PVector)perpVectorPoints.get(idx);
    return thePoint.get();
  }
}
