
/**
 * 
 * Project 3 Template
 * UCLA Design Media Arts, Spring 2011 
 * Prof. Casey Reas
 * 
 * Based on code from Lorenzo Bravi:
 * http://www.lorenzobravi.com/projects/workshop-isia/
 */

float v; 
float easing = 0.8;  // Between 0 and 1
float volumeScalar = 1000;
boolean noMic = true;

PImage bgbars;
PImage base;
PImage jaw;
PImage mouth;
PImage nose;
PImage cheeklines;
PImage eyes;
PImage eyebrowleft;
PImage eyebrowright;
PImage eyelidright;
PImage eyelidleft;
PImage pupilright;
PImage pupilleft;
PImage whiteright;
PImage whiteleft;


void setup() {
  size(500, 500);
  smooth();
  setupVolume();
  startFace();

  bgbars = loadImage("bgbars.png");
  base = loadImage("base.png");
  jaw = loadImage("jaw.png");
  mouth = loadImage("mouth.png");
  nose = loadImage("nose.png");
  cheeklines = loadImage("cheeklines.png");
  eyes = loadImage("eyes.png");
  eyebrowleft = loadImage("eyebrowleft.png");
  eyebrowright = loadImage("eyebrowright.png");
  eyelidright = loadImage("eyelidright.png");
  eyelidleft = loadImage("eyelidleft.png");
  pupilright = loadImage("pupilright.png");
  pupilleft = loadImage("pupilleft.png");
  whiteright = loadImage("whiteright.png");
  whiteleft = loadImage("whiteleft.png");
}

void draw() {
  background(255);

  getVolume();

  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);
  }

  testFace();

  //saveFrame("mask-####.png");
}


