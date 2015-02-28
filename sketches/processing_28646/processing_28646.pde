
/**
* 
* Project 3 Template
* UCLA Design Media Arts, Spring 2011 
* Prof. Casey Reas
* 
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;

float v; 
float easing = .8;  // Between 0 and 1
float volumeScalar = 2000;
boolean noMic = true;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();
  img1 = loadImage("baby.png");
  img2 = loadImage("eyes.png");
  img3 = loadImage("eyes2.png");
  img4 = loadImage("nose.png");
  img5 = loadImage("eh.png");
  img6 = loadImage("eh2.png");
  img7 = loadImage("nostril.png");
  img8 = loadImage("nostril2.png");
  img9 = loadImage("tooth.png");
  img10 = loadImage("blood.png");
  img11 = loadImage("blood2.png");
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


