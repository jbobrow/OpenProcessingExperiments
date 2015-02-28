
//Copyright Eric Mackie, November 2011, Pittsburgh PA
// CMU: Computing in the Arts with Processing - 60-257 with Jim Roberts

float xLoc[], yLoc[], zLoc[];
float xPos[], yPos[], zPos[];
float zDelt[];
float zStart=-2000;
int numClouds = 15;
int numSpheres = 15;
float diam = 20;
float xVari = 30;
float yVari=8;
float zVari=5;

void setup() {
  size(450, 450, P3D);
  sphereDetail(8);
  noStroke();


  xLoc=new float [numSpheres];
  initPos(xLoc, -xVari, xVari);
  yLoc=new float [numSpheres];
  initPos(yLoc, -yVari, yVari);
  zLoc=new float [numSpheres];
  initPos(zLoc, -zVari, zVari);

  xPos=new float [numClouds];
  initPos(xPos, 0, width);
  yPos=new float [numClouds];
  initPos(yPos, 0, height);
  zPos=new float [numClouds];
  initPos(zPos, zStart, 100);

  zDelt=new float [numClouds];
  initPos(zDelt, .05, .5);


  camera(width/2, height/2, 200, width/2, height/2, 0, 0, 1, 0);
}


void initPos(float myArray[], float low, float high) {
  for (int i=0; i<numClouds; i++) {
    myArray[i]=random(low, high);
  }
}


void draw() {
  colorful();
  makeCloudsReal();
}


void colorful() {
  background(180, 200, 240);
  directionalLight(255, 255, 255, 0, 0, -200);
}


void makeCloudsReal() {
  for (int i=0; i<numClouds; i++) {
    createClouds(xPos[i], yPos[i], zPos[i]);
    moveClouds();
  }
}


void createClouds(float xCenter, float yCenter, float zCenter) {

  translate(xCenter, yCenter, zCenter);
  for (int i=0; i<numSpheres; i++) {
    translate(xLoc[i], yLoc[i], zLoc[i]);
    sphere(diam);
  }
  translate(-xCenter, -yCenter, -zCenter);
}


void moveClouds() {
  for (int i=0; i<numClouds; i++) {
    zPos[i]+=zDelt[i];
    if (zPos[i]>=100) {
      zPos[i]=zStart;
    }
  }
}


