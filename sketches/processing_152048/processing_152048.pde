
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

int     num;    // the number of items in the array (# of circles)
int     margin; // the vertical border to be left undrawn
float   sizeCircle; // the size of the circles to be drawn
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 60;
float green = 120;
float blue = 240;

void setup() {
  size(500, 500);
  margin = 50;
  num = 180;
  sizeCircle = constrain(width/num, 5, 40); // higher num, smaller circles, min 5, max 40

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    // using mapped values instead of calculating gap
    y[i] = map (i, 0, num, margin, height-margin);
    speed[i] = map(i, 0, num, 0, 10);  // between 0 and 10 according to the value of i
    phase[i] = map(i, 0, num, 0, TWO_PI); // between 0 and 2*PI according to the value of i
  }
}


void draw() {
  background(red/16, green/16, blue/16); // always darker than the fill colour
  noStroke();
  fill(red, green, blue);
  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200;
    ellipse(x, y[i], sizeCircle, sizeCircle);
  }
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

