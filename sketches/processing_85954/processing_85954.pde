
int rStart, rStop;
float[][] radii;
float nX, nY, yY;
float masterX, masterY;
int models;
float nRadius, outRadius;
int degs;
float inBetween, totalTweens;
int circleNumber;

void setup() {
  colorMode(HSB);
  smooth();
  size(1200, 600);
  degs=360;
  nRadius=1.300;
  outRadius=321;
  totalTweens=27.0;
  inBetween=0.0;
  circleNumber=1;
  background(#FFFFFF);
  models=199;
  radii = new float[models][degs];
  doSetupModels();
  masterX=-300;
  masterY=height/2;
  colorMode(HSB);
  strokeWeight(0.2);
  fill(255, 4);
}

void doSetupModels() {
  for (int i=0;i<models;i++) {
    float[] ptTemp = new float[degs];
    float zz=random(3);
    radii[i]=doNewCircle(zz, zz-1);
  }
}

void draw() {
  if (masterX>2100) {
    masterX=-225;
    circleNumber=5;
    inBetween=0;
    noLoop();
  }
  if (inBetween<totalTweens && circleNumber+1<models) {
    float[] hybridCircle = new float[degs];
    hybridCircle=doInterpolate(radii[circleNumber], radii[circleNumber+1], inBetween/totalTweens);
    doSimpleOutline(hybridCircle);
    inBetween++;
  } 
  else {
    if (circleNumber+1<models) {
      circleNumber++;
      inBetween=0;
    }
  }
}

float[] doInterpolate(float[] cOne, float[] cTwo, float beTwixt) {
  float[] ptTemp = new float[degs];
  for (int j=0; j<degs;j++) {
    ptTemp[j]=coslerp(cOne[j], cTwo[j], beTwixt);
  }
  return ptTemp;
}

void doSimpleOutline(float[] myCircle) {
  masterX=masterX+3.0;
  doDrawCircle(int(masterX), int(masterY), myCircle);
}

float coslerp(float val1, float val2, float amt) {
  amt = map (cos(amt*PI), 1.0, -1.0, 0, 1.0);
  return lerp(val1, val2, amt);
}





void doStripes(int xPos, int yPos, float[] ptRad) {  
  pushMatrix();
  translate(xPos, yPos);
  for (int j=0;j<degs;j=j+1) { 
    float rj=radians(j);
    float xA=sin(rj)*ptRad[j];
    float yA=cos(rj)*ptRad[j];
  }
  popMatrix();
}


void doDrawCircle(int xPos, int yPos, float[] ptRad) {  
  pushMatrix();
  translate(xPos, yPos);
  rotate(radians(frameCount*0.95125));

  color col=color(round(map(xPos, 0, width, 80, 255)), 255, 180);
  stroke(col);
  beginShape();  
  for (int j=0;j<degs;j=j+1) { 
    float rj=radians(j);
    float xA=sin(rj)*ptRad[(j)];
    float yA=cos(rj)*ptRad[(j)];
    vertex(xA, yA);
  }
  endShape();
  popMatrix();
}

float[] doNewCircle(float nXstart, float nYstart) {
  float[] theCircle = new float[degs];
  for (int i=0+int(frameCount/2.0);i<degs+int(frameCount/2.0);i++) {
    nX=sin(radians(i))*nRadius+nXstart;
    nY=cos(radians(i))*nRadius+nYstart;
    theCircle[i]=map(noise(nX, nY), 0, 1, 0, outRadius);
  }
  return theCircle;
}



