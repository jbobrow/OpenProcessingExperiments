
//

//global draw PARAMS
final int FACES = 1;
int facesDrawn = 0;
boolean dirty = true;
boolean titleScreenOn = true;

int centerForeheadX = 300; 
int centerForeheadY = 25;
PVector start = new PVector(centerForeheadX, centerForeheadY);
int faceMedian = centerForeheadX;

int faceLength = 300;
int centerChinX = centerForeheadX;
int centerChinY = centerForeheadY + faceLength;
PVector end = new PVector(centerChinX, centerChinY);

int stepsize = 20; //the length of the segments used to construct face
int segments = 25;   // number of segments used to construct face

//track where we are
PVector[] facePoints;

//more face params
float EYE_POSITION = .3; //must be less that 1; the larger the further down the face
float NOSE_POSITION = .3; 
int NOSE_WIDTH = 30;
int NOSE_LENGTH = 70;
float MOUTH_POSITION = .7; 
int MOUTH_WIDTH = 60;
int MOUTH_HEIGHT = 40;

PFont font;

void setup() {
 smooth();
 size(900, 600);
 
 font = loadFont("Monaco-24.vlw");
 textFont(font);
 _titleScreen(); 
}

void draw() {
  if(titleScreenOn)
    return;
    
  if(!dirty)
    return;
  background(255);
  drawFace();
  drawEye();
  drawNose();
  drawMouth();
  dirty = false;
}

// test sketchbook =
//    self_portrait_full_face.pde
//
void drawFace() { 
  facePoints = new PVector[segments-1]; //don't need to store the last point it is the end point
  PVector lastPt = start, lastReflectPt = start;
  PVector nextPt, reflectPt;
  
  for(int i=0; i<segments -1 ; i++) {
    PVector toEnd =  PVector.sub(end,lastPt); 
    toEnd.normalize();
    float maxTheta = acos(toEnd.x);
    float myTheta = random(0,maxTheta);
  
    nextPt = new PVector(lastPt.x + stepsize*cos(myTheta),
                         lastPt.y + stepsize*sin(myTheta));
    facePoints[i] = nextPt;  
    line(lastPt.x, lastPt.y, nextPt.x, nextPt.y);  
  
    reflectPt = _reflectPoint(nextPt);
    line(lastReflectPt.x, lastReflectPt.y, reflectPt.x, reflectPt.y);  
 
  
    //cleanup loop vars  
    lastPt = nextPt;
    lastReflectPt = reflectPt;
    reflectPt = null;
    nextPt = null; 
  }
  //close the face
  line(lastPt.x,lastPt.y,end.x,end.y); 

  reflectPt = _reflectPoint(end); 
  line(lastReflectPt.x, lastReflectPt.y, reflectPt.x, reflectPt.y);
  line(reflectPt.x, reflectPt.y, end.x, end.y);

}

void drawEye() {
  int iWidth = 10;
  
  PVector p = _fetchFacePoint(EYE_POSITION); 
  
  float quarterBridge = abs(faceMedian - p.x) / 2;
  float iBall = p.x - quarterBridge;
  PVector eyePt = new PVector(iBall, p.y);
  
  pushMatrix();
  translate(eyePt.x,eyePt.y);
  rotate(QUARTER_PI);
  rect(-iWidth/2, -iWidth/2, iWidth, iWidth);
  popMatrix();
  
  PVector otherEye = _reflectPoint( eyePt );
  pushMatrix();
  translate(otherEye.x, otherEye.y);
  rotate(QUARTER_PI);
  rect(-iWidth/2, -iWidth/2, iWidth, iWidth);
  popMatrix();
  
  //eye ball
  fill(0);
  ellipse(eyePt.x, eyePt.y, 3, 3);
  ellipse(otherEye.x, otherEye.y, 3, 3);
  fill(255);  
  
}

void drawNose() {
  PVector p = _fetchFacePoint(NOSE_POSITION); 
  triangle( faceMedian, 
        p.y, 
        faceMedian + NOSE_WIDTH / 2,
        p.y + NOSE_LENGTH,
        faceMedian - NOSE_WIDTH / 2,
        p.y + NOSE_LENGTH);    
}

void drawMouth() {
  PVector p = _fetchFacePoint(MOUTH_POSITION);   
  ellipse(faceMedian, p.y, MOUTH_WIDTH, MOUTH_HEIGHT);
}

void mousePressed() {
  if(titleScreenOn)
    titleScreenOn = false;
  dirty = !dirty;
}

void keyPressed() {
  switch(key) {
   case 'e':
   case 'E':
     _setEyeParameter();
     break;
   case 'n':
   case 'N':
     _setNoseParameter();
     break;
   case 'm':
   case 'M':
      _setMouthParameter(); 
      break;
   default:
     break;
  } 
}

void _setEyeParameter() {
 EYE_POSITION = random(.01,0.95);
 dirty = true; 
}

void _setNoseParameter() {
 NOSE_POSITION = random(.01,0.95); 
 NOSE_WIDTH = int(random(2,50));
 NOSE_LENGTH = int(random(1, 100));  
 dirty = true; 
}

void _setMouthParameter() {
  MOUTH_POSITION = random(.01,0.95); 
  MOUTH_WIDTH = int(random(2,50));
  MOUTH_HEIGHT = int(random(1, 100));
  dirty = true;   
}


float _distFromMedian(PVector p) {
  return faceMedian - p.x;
}

PVector _reflectPoint(PVector p) {
  return new PVector(faceMedian + (faceMedian - p.x), p.y);
}

//index Ratio is param between 0 - 1
PVector _fetchFacePoint(float indexRatio) {
  return facePoints[int(facePoints.length * indexRatio)];
}

void _titleScreen() {
 text("the faces of rhazes\n\ncontrols:\n"
      + "-- click the mouse to redraw \n\n"
      + "-- press 'e' to adjust eyes\n\n"
      + "-- press 'n' to adjust nose\n\n"
      + "-- press 'm' to adjust mouth\n\n"
      + "click the mouse to begin",
      100,
      100);
}

