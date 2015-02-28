
/*
A Study in Happy Rectangles
 Copyright Engin Ayaz
 Student at NYU ITP program, Class of 2013
 ICM Class
 Week 2 Homework
 Sep 22 2011
 */

/* 
 Task: Create a compelling sketch using rotate and/or transform functions
 
 Sketch inspired by the following example in openprocessing: 
 http://openprocessing.org/visuals/?visualID=35401#
 */

// initialize counter and its duration for debugging and additional future functionality
int countTime = 0;
int framePace = 30;
int countMax = framePace * 80; // make this a 80 second animation

// set background color
int backgroundColor = 255;

int rectColor = 255;  // Do not set it lower than 80, so that the border remains visible
int strokeColor = rectColor - 80; // to make border visible, use 80 as difference

// To set fill or stroke transparency of rectangles. 0 is fully transparent, 255 is fully opaque.
int transparency = 80;

// rectangle border smoothness. 1 equals sharp, 10+ equals very rounded.
int rectBorderShape = 2;

// Set up of the screen and animation properties
void setup() {
  size(600, 600);
  background(backgroundColor);   // set background to very light grey
  rectMode(CENTER);  // switch rectangle drawing mode for mouseClick user friendliness of interaction 
  frameRate(framePace);     // set the framerate
}

void draw() {
  smooth();
  countTime++;  // increment timer for debugging and stopping the animation

  // this if statement makes sure the animation does not go on forever
  if (countTime < countMax) {

    // if mouse is pressed, draw rectangles of random size with a color range from yellow to red
    if (mousePressed) {
      pushMatrix();                         // use this function to make sure the grid is reset after each loop
      translate(mouseX, mouseY);  // translate the origin of the grid to where the mouse is located

      // if mouse location is changed, then draw filled rectangles
      if (mouseX != pmouseX) { 
        rotate(random(PI));
        fill(255, random (240), 0, transparency);  // the RGB set this way leads to yellow to red colors only
        rect(0, 0, random(5, 80), random(5, 80), rectBorderShape);
      }

      // if mouse location is not changed, then draw only rectangle outlines
      else {
        noFill();
        strokeWeight(1);   // use small strokes of grey color
        rotate(random(PI));
        stroke(255, random (240), 0, transparency);  // the RGB set this way leads to yellow to red colors only
        rect(0, 0, random(0, 400), random(0, 400), rectBorderShape);
      }
      popMatrix();
    }

    // if mouse is not pressed, draw all the grey rounded rectangles in the background
    else {
      float centerX = random(800);
      float centerY = random(800);
      rotate (random(TWO_PI));
      strokeWeight(1);  
      stroke(strokeColor, strokeColor, strokeColor, transparency);
      fill(rectColor, rectColor, rectColor, transparency/2);
      rect (centerX, centerY, random(400), random(400), random(rectBorderShape*5));
      rect (centerX, centerY, random(400), random(400), random(rectBorderShape*5));
    }

    // erase the screen when a key is pressed, and set the timer to 0
    if (keyPressed) {
      background(backgroundColor);
      countTime = 0;
    }

  }

  // stop the animation when it reaches countMax (see the if statement above)
  else {
    noLoop();
  }

  // use this for debugging
  // println(countTime);
}

