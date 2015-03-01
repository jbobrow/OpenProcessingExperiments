
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */
 
 /* Modified by Richard Lyall to add click interactivity */

int     num;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
boolean[] moving; // moving or stationary
float[] fixedXPos; // the x position of a stationary circle
int[] greyFill; // greyscale fill for clicked circles

float red = 192;
float green = 192;
float blue = 192;

void setup() {
  size(500, 500);

  num = 20;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 
  moving = new boolean[num];
  fixedXPos = new float[num];
  greyFill = new int[num];

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
    moving[i] = true;         // everything moving initially
    greyFill[i] = 255;
  }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<num; i++) {
    
    // calculate the x-position of each ball based on the speed, phase and current frame
    // If the object has been clicked, display it in its stored position
    float x;
        if (moving[i] == true) {
      x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200; }
    else {
      x = fixedXPos[i];
    }
    
    fill(greyFill[i]);
    ellipse(x, y[i], 20, 20);
  }
}


// change the background colour if the mouse is dragged
/*void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}*/

void mouseClicked () {

  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    
    //Check for a mouse click in the static stored X position (if circle not moving)
    //Or in the moving position
    float x;
    
    if (moving[i] == true) {
      x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200; }
    else {
      x = fixedXPos[i];
    }
    
    //Check if we've clicked on a circle
    float clickDist = dist(mouseX,mouseY,x,y[i]);
    
    if (clickDist <= 10) { //Did we click within a radius of the centre?
      println("Circle " + i + " clicked.");
      
      //Store the x position for the stationary circle
      fixedXPos[i] = x;
      
      //Toggle movement
      moving[i] = !moving[i];
      
      //Select a new speed if the circle starts moving again
      if (moving[i] == true) {
        speed[i] = random(10);
        greyFill[i] = 0; //black fill if restarted
      } else {
        greyFill[i] = 128; //grey fill if stopped
      }
      
    }
      
  }

}
