
///////MINIM initi. starts here//////
import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.pdf.*;
boolean record;


// PDF
  
Minim minim;
AudioInput in;

FFT fft;
String windowName;
/////MINIM ends here////

int i;

float[] posX = new float[200];
float[] posY = new float[200];
float[] posZ = new float[200];
int[] hueValue = new int[200];
Sphere[] mySphere = new Sphere[200];

int cameraX;
int cameraY;
int cameraZ;

PVector mCameraLook = new PVector();

//////////SETUP begins here//////

void setup() {
  size(1000, 600, P3D);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  textFont(createFont("SanSerif", 18));

  background(255);
  colorMode(HSB);
  smooth();
  noStroke();

  for (i=0;i<200;i++) {
    posX[i] = random(100, width-100);
    posY[i] = random(200, height-50);
    posZ[i] = random(-500, 100);
    hueValue[i] = int(random(0, 255));
    mySphere[i] = new Sphere(posX[i], posY[i], posZ[i], hueValue[i]);
  }
  if (record) {
    beginRecord(PDF, "####.pdf");
  }

}



int maxFreq = 30;
void draw() {

  background(255);

  /////////MINIM CODE////////////
  fft.forward(in.mix);
  float scaleFactor = width/float(maxFreq);
  int highestFreq = 0;
  float highestVal = 0;
  for (int i = 0; i < maxFreq; i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better

      float col = map (i, 0, maxFreq, 0, 255);
    fill(col, 255, 255);
    rect(map(i, 0, maxFreq, 0, width), height, 5, - fft.getBand(i)*4);
    if (fft.getBand(i) > highestVal) {
      highestVal = fft.getBand(i);
      highestFreq = i;
    }
  }

  fill(0);
  text("The higest freq: " + highestFreq, 5, 20);
  noFill();
  ////MINIM code ends/////

  for (i=0;i<200;i++) {
    mySphere[i].drawSphere();
  }

  int tempHue = int(map(highestFreq, 0, 30, 0, 255));

  PVector mCenterOfMass = new PVector(0, 0, 0);
  int count =0;

  for (i=0;i<200;i++) {

    if (tempHue-10< mySphere[i].hueValue && mySphere[i].hueValue < tempHue+10) {
      mySphere[i].flock();
      mCenterOfMass.add(mySphere[i].position);
      count++;
    }

    else {

      mySphere[i].unflock();
      mySphere[i].alphaValue = 255;
    }
  }
  if (count < 1) {
    mCenterOfMass.set(0, 0, 0);
  } 
  else {
    mCenterOfMass.mult(1.0/count);
  }


  PVector mDiff = PVector.sub(mCenterOfMass, mCameraLook);
  mDiff.mult(0.025);
  mCameraLook.add(mDiff);

  cameraX = width/2;
  cameraY = height/2;
  cameraZ = int(1.5*mouseY);
  camera(width/2, height/2, (height/2) / tan(PI/6), 
  mCameraLook.x, mCameraLook.y, mCameraLook.z, 
  0, 1, 0);
}

void keyPressed(){
  if (record) {
    endRecord();
    record = false;
  }
  if (key == 'r') {
    record = true;
  }
}

void stop()
{
  in.close();
  minim.stop();

  super.stop();
}
