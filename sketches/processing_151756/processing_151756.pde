
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
float   colour=0;
float[] x;
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

void setup() {
  size(500, 500);

  num = height/2;

  // allocate space for each array
  x = new float[num];
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = (float) height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);
    speed[i] = map( y[i], 0, height, 1, 3 );
    phase[i] = 1;
  }

  fill(#ffffff);
}


void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    x[i] = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 100;


    noStroke();

      ellipse( x[i], y[i],5,5 );

  } //end for()

} // end draw()

