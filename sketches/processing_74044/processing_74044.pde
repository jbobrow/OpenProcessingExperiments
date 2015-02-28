
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

TimeSphere[] spheres;
boolean shiftOn;
int alpha1 = 0;
int numCycles;
int numSpheres = 20;
int curY;
PImage bg;
int bgCounter = 0;
boolean moveLeft;
int soundCounter = 0;
boolean animating;

int resetCount = 0;
int resetAlpha = 0;

Minim minim;
AudioPlayer song;

void setup() {
  minim = new Minim(this);
  song = minim.loadFile("ticktock.wav");

  size(250, 1000, P3D);
  background(0);
  bg = loadImage("bg.png");
  noStroke();

  spheres = new TimeSphere[numSpheres];
  for (int i = 0; i < numSpheres; i++) {
    float xrand = random(0, 1);
    float speed = random(0.004, 0.009);
    PImage ti = loadImage("texture.png");
    TimeSphere timeS = new TimeSphere(xrand, speed, ti);
    spheres[i] = timeS;  
  }
  song.loop();
}

void draw() {
  image(bg, 0, 0);
  lights();

  int resetTally = 0;
  for (int i = 0; i < numSpheres; i++) {
    fill(255, 255, 255, 254);
    resetTally += spheres[i].drawSphere(30, numCycles);
  }
  changeTempo();
  if(resetTally >= numSpheres || animating) {
    animating = true;
    resetAnimate();
  }
}

void resetAnimate() {
  fill(255, resetAlpha);
  rect(0, 0, width, height);
  resetCount += 1;
  if(resetCount == 60) {
    resetSpheres();
  }

  if(resetCount > 60) {
    resetAlpha -= 8;
    if(resetCount > 120) {
      resetCount = 0;
      resetAlpha = 0;
      animating = false; 
    }
  }
  else {
    resetAlpha += 8; 
  }
}


void resetSpheres() {
  for(int i = 0; i < numSpheres; i++) {
    spheres[i].isVis = false;
    spheres[i].startFading = false;
    spheres[i].alphaS = 254;
    spheres[i].xposInit = random(0, 1);
  }
}

void changeTempo() {
  if (shiftOn) {
    curY = mouseY;
    float seconds = 0.07817*curY*curY+2.218*curY+10;
    numCycles = int(seconds/50);
    if (alpha1 <= 190) {
      alpha1 += 2;
    }
  }
  else {
    if (alpha1 >= 0) {
      alpha1 -= 2;
    }
  }
  fill(170, 255, 255, alpha1);
  rect(width/2+110, 0, 30, height);

  fill(190, 255, 255, alpha1);
  rect(width/2+100, 0, 30, height);

  fill(220, 255, 255, alpha1);
  rect(width/2+90, 0, 10, height);  

  float i = 1;
  while (i < height) {
    //rect(width/2+50, i, 40, 2);
    triangle(width-55, i, width-35, i-4, width-35, i+4);
    i *= 1.33;
  }

  quad(width-30, curY, width-25, curY+10, width-10, curY, width-25, curY-10);
  quad(width-60, curY, width-25, curY+10, width-10, curY, width-25, curY-10);
}

void mouseClicked() {
  shiftOn = !shiftOn;
}


