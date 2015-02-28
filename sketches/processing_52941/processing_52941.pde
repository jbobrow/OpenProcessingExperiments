
import ddf.minim.*;
Minim minim;         
AudioPlayer mySound;

// define our shape variable
PShape bg;
PShape tri1;
PShape tri2;

float angle;
float jitter;

float angle2;
float jitter2;

float tri1Scale;
float tri2Scale;

float bgScale = 250;
float bgScaleChange = 0.98;
float ScaleLimit = 320;

// set up our app borders
void setup() {
  // set the size of our app
  size(370,370);
  
  // find our shape
  bg = loadShape("bg.svg");
  tri1 = loadShape("tri1.svg");
  tri2 = loadShape("tri2.svg");
  
  minim = new Minim(this);
  mySound = minim.loadFile("BORETA.mp3");
  mySound.play();
  
  // anti-alias that shit!
  smooth();
  
  //noLoop();
  frameRate(30);
  
  shapeMode(CENTER);
}

// draw our shape
void draw() {
  // set a background
  background(255,255,255);
  
  // every three seconds, change up the rotation and scale!
  if (second() % 2 == 0) {  
    jitter = random(0.5, 3.5);
    jitter2 = random(0.5, 3.5);  
  }
  
  angle = angle + jitter;
  angle2 = angle2 + jitter2;
  
  tri1Scale = jitter*10;
  tri2Scale = jitter*8;
  
  // START BACKGROUND ANIMATION
  pushMatrix();
    // reposition the object in the center of the screen
    translate(width/2, height/2);
    bgScale += bgScaleChange;
  
    // if the scale has moved past its limit,
    // reverse direction and set within limits.
    if (bgScale > ScaleLimit || bgScale < 250)
    {
      bgScaleChange = -bgScaleChange;
      bgScale += bgScaleChange;
    }
    
    // draw the shape
    shape(bg, 0, 0, bgScale, bgScale);
  popMatrix();
  
  
  // START BG TRIANGLE ANIMATION
  pushMatrix();
    // set our angle multiplier
    float c = cos(angle);
  
    // reposition the object in the center of the screen
    translate(width/2, height/2);
    
    // rotate that bastard
    rotate(angle*TWO_PI/360);
    
    // draw the shape
    shape(tri1, 0, 0, 250-tri1Scale, 250-tri1Scale);
  popMatrix();
  
  // START FG TRIANGLE ANIMATION
  pushMatrix();
    // set our angle multiplier
    float c2 = cos(angle);
  
    // reposition the object in the center of the screen
    translate(width/2, height/2);
    
    // rotate that bastard
    rotate(-angle2*TWO_PI/360);
    
    // draw the shape
    shape(tri2, 0, 0, 250-tri2Scale, 250-tri2Scale);
  popMatrix();
}

