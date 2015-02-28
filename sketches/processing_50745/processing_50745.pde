
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
float easing = 0.1;  // Between 0 and 1
float volumeScalar = 110;
boolean mic = true;

PImage head;
PImage body;
PImage la;
PImage ra;
PImage ll;
PImage rl;
PImage tail;
PImage bird;
PImage lw;
PImage rw;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();
   noStroke();
  head = loadImage ("head.png");
  body = loadImage ("body.png");
  la = loadImage ("left arm.png");
  ra = loadImage ("right arm.png");
  ll = loadImage ("left leg.png");
  rl = loadImage ("right leg.png");
  tail = loadImage ("tail.png");
  bird = loadImage("bird body.png");
  lw= loadImage("left wing.png");
  rw= loadImage("right wing.png");
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



