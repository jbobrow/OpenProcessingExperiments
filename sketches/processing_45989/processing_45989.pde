
//Super Mario Clouds 3D...
//Cristobal Cea. Based on 3D sketch by Eric Mackie.

//let's try with opengl. P2D had problems with smoothing.
import processing.opengl.*;
//Sound Library
import ddf.minim.*;
Minim minim;
AudioSample smb;
 
float xLoc[], yLoc[], zLoc[];
float xPos[], yPos[], zPos[];
float zDelt[];
float zStart=-2000;
int numClouds = 10;
int numCubes = 15;
float diam = 20;
float xVari = 30;
float yVari=8;
float zVari=10;
 
void setup() {
  
  size(200, 800, OPENGL);
  
  minim = new Minim(this);
  smb = minim.loadSample ("smb-s.mp3", 8192);
  smb.trigger();
 
  xLoc=new float [numCubes];
  initPos(xLoc, -xVari, xVari);
  yLoc=new float [numCubes];
  initPos(yLoc, -yVari, yVari);
  zLoc=new float [numCubes];
  initPos(zLoc, -zVari, zVari);
 
  xPos=new float [numClouds];
  initPos(xPos, 0, width);
  yPos=new float [numClouds];
  initPos(yPos, 0, height);
  zPos=new float [numClouds];
  initPos(zPos, zStart, 100);
 
  zDelt=new float [numClouds];
  initPos(zDelt, .05, .5);
  
  frameRate(24);
  //smooth(); //Smoothing makes things go REALLY SLOW ON P2D. NOT ON OGL.
 
 
  camera(width/2, height/4, 100, width/2, height/4, 0, 0, 1, 0);
}
 
 
void initPos(float myArray[], float low, float high) {
  for (int i=0; i<numClouds; i++) {
    myArray[i]=random(low, high);
  }
}
 
 
void draw() {
  
  Scenery();
  makeCloudsReal();
}
 
 
void Soundtrack() {
    for (int i = 0; i < smb.bufferSize() - 1; i++)
  {
    line(i, 100 - smb.left.get(i)*50, i+1, 100 - smb.left.get(i+1)*50);
  }
}

void Scenery() {
  background(100, 200, 255);
  directionalLight(255, 255, 255, 0, 0, -100);
}
 
 
void makeCloudsReal() {
  for (int i=0; i<numClouds; i++) {
    createClouds(xPos[i], yPos[i], zPos[i]);
    moveClouds();
  }
}
 
 
void createClouds(float xCenter, float yCenter, float zCenter) {
 
  translate(xCenter, yCenter, zCenter);
  for (int i=0; i<numCubes; i++) {
    translate(xLoc[i], yLoc[i], zLoc[i]);
    box(diam);
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


