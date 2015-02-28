
/*
author: mpinner
 date: 2013-03-02
 
 intent: simulate rgb led balls for testing sequeces
 
 usage: 
 - x, y, and z keys will enable/dissable the rotations along these axises
 
 */

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;  
AudioInput in;
FFT fft;

int rings[] = {7, 11, 15, 17, 19, 19, 17, 15, 11, 7};

int ringHeights[] = {
  -8, -7, -5, -3, -1, 1, 3, 5, 7, 8
};

int SCALE = 10;
int colorMax; // need init in setup()


boolean rotX = false;
boolean rotY = false;
boolean rotXY = false;
boolean rotZ = false;

boolean nuts = false;
boolean frames = false;
boolean redOn = false;
boolean greenOn = false;
boolean blueOn = true;

int audio = 0;


static final int nPoints = 12;                   // # polyhedron vertices
PVector          pt[]    = new PVector[nPoints]; // 3D vertex coordinates
int ledCount = 0;

void setup() {


  for (int ring=0; ring < rings.length; ring++) {
    ledCount += rings[ring];
  }

  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, ledCount);
  fft = new FFT(1024, 44100);


  colorMax = ledCount;

  colorMode(RGB, 256);

  int   i;
  float c, r, h, angle, a;

  size(800, 800, P3D);
  sphereDetail(6);

  // Calculate a few icoshedron fundamentals (thanks Wikipedia!)
  c = 2.0 * sin(radians(72.0) / 2.0);           // Edge length (chord)
  r = (c / 4.0) * sqrt(10.0 + 2.0 * sqrt(5.0)); // Radius of circumsphere
  h = sqrt(c * c - 1.0);                        // Height of "endcaps"

  // Place vertices using 5-fold symmetry around Y axis.
  // Processing 3D coord system is a little funky, positive Y being down.
  pt[0] = new PVector(0.0, -r, 0.0);            // Point 0 = top vertex
  for (angle=0.0, i=1; i<6; i++, angle += 72.0) {
    a       = radians(angle);                   // Azimuth of "upper" vertex
    pt[i]   = new PVector(cos(a), h-r, sin(a)); // Points 1-5 = upper ring
    a       = radians(angle + 36.0);            // Azimuth of "lower" vertex
    pt[i+5] = new PVector(cos(a), r-h, sin(a)); // Points 6-10 = lower ring
  }
  pt[11] = new PVector(0.0, r, 0.0);            // Point 11 = Bottom vertex
}

void draw() {
  int i, j, k;

  background(0);
  ball(1);

  return;
}

void ball(int shift) {
  pushMatrix();
  translate(width / 2.0, height / 2.0);
  if (rotX) rotateX(radians(mouseY/(float)height*360));
  if (rotY) rotateY(radians((float)mouseX/width*360));
  if (rotXY) {
    rotateX(radians(shift*frameCount * 0.01));
    rotateY(radians(shift*frameCount * 0.01));
  }

  if (rotZ) rotateZ(shift*frameCount * 0.01);
  scale(width / 3.0);

  /*  for(i=0; i<5; i++) {
   j = 1 + (i + 1) % 5;
   k = 6 + (i + 1) % 5;
   face(0,i+1,j);   // Top endcap faces
   face(i+1,j,i+6); // Upper mid faces
   face(j,i+6,k);   // Lower mid faces
   face(i+6,k,11);  // Bottom endcap faces
   }
   */
  int ledIndex = 0;
  for (int ring=0; ring < rings.length; ring++) {
    int ringLedCount = rings[ring];
    float degreesPerLed = 360 / (float)ringLedCount; 
    int ringHeight = ringHeights[ring];

    for (int rad = 0; rad < ringLedCount; rad++) {
      ledIndex++;
      int ledDegree = (int)(rad*degreesPerLed);
      pushMatrix();
      translate(sin(radians(ledDegree))* ringLedCount / 40, cos(radians(ledDegree))* ringLedCount / 40, ringHeight/10.0);
      scale(0.01); // Processing has trouble with tiny spheres,
      // fillFromIndex(ledIndex+frameCount);
      fillFromIndex(ledIndex);
      //fillFromIndex(ledDegree);
      noStroke();

      int scale = SCALE;

      scale += in.left.get(ledIndex%ledCount)*audio;

      sphere(scale);   // so set 'scale' small & draw a big one.
      popMatrix();
    }
  }
  popMatrix(); 
  return;
}


void fillFromIndex(int index) {

  int i = index % colorMax;

  float timeSec = ((float)millis()/10000.0);
  if (frames) timeSec = frameCount/1000.0;

  if (nuts) {
    int r = 0;
    int g = 0;
    int b = 0;
    if (redOn) r = (int)(sin(radians(index)*timeSec*3.333)*255);
    if (greenOn)g = (int)(sin(radians(index)*timeSec*3.666)*255);
    if (blueOn) b = (int)(sin(radians(index)*timeSec*9.0)*255);
    // int g = (int)(sin(timeSec*6.2*(i*3+1)/30.0)*255);
    //    int b = (int)(sin(timeSec*6.2*(i*3+2)/29.666)*255);
    fill( r, g, b);
  } 
  else {
    fill((index+frameCount)%256);
  }

  // fill(index, mouseX, mouseY);
  //  fill(index, colorMax, colorMax);

  return;
}

void keyTyped() {
  if (key == 'x') {
    rotX = (false == rotX);
  }

  if (key == 'y') {
    rotY = (false == rotY);
  }

  if (key == 'q') {
    rotXY = (false == rotXY);
  }

  if (key == 'z') {
    rotZ = (false == rotZ);
  }  

  if (key == 'n') {
    nuts = (false == nuts);
  }

  if (key == 'f') {
    frames = (false == frames);
  }
  
  
  if (key == 'r') {
    redOn = (false == redOn);
  }
  
  if (key == 'g') {
    greenOn = (false == greenOn);
  }
  
  if (key == 'b') {
    blueOn = (false == blueOn);
  }

  if (key == '+') {
    audio += 1;
    println("audio:"+audio);
  } 
  if (key == '-') {
    audio -= 1;
    println("audio:"+audio);
  }
}



