
/**
* Project 1 Template
* UCLA Design Media Arts, Fall 2011 
* Prof. Casey Reas
* 
* Note: Put all of your code in the "testFace" tab. Leave
* this tab and the "volume" tab as they are. You can set
* your variables at the top of "testFace".
* 
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 1500;
boolean mic = true;
PImage MOUSTACHE;
PImage PAPER;
float x = 250;
float speed = 4;
int direction = 1;
int dark = 30;
int light = 255;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  MOUSTACHE = loadImage("MOUSTACHE.png");
  PAPER = loadImage ("PAPER.png");
  setupVolume();
}

void draw() {
  background(255);

  getVolume();
  
  if (mic == false) {
    v = mouseX; 
  }
  
  testFace();
 
  //saveFrame("mask-####.png");
}


