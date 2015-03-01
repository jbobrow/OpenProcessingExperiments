
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;



void setup() {

  // make the display window the full size of the screen
  size(displayWidth /2 , displayHeight /2 );

  frame_rate_value = 12;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0);

  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  strokeWeight(2);
  stroke(255, lerp(232, 0, circleAge));
  fill(lerp(400, 67, circleAge), lerp(230, 0, circleAge));
  rect(x-size/2, y-size/2, circleSize, circleSize);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void mousePressed(){
 
  // right arrow -- increase frame_rate_value
  if (mouseX >= 555) {
    frame_rate_value=12;
  }
   if (mouseX >= 755) {
    frame_rate_value=8;
  }
  // left arrow -- decrease frame_rate_value
  if ( mouseX <= 556) {
    frame_rate_value=25;
  }
 if ( mouseX <= 256) {
    frame_rate_value=45;
 
  }

  // print the current value on the screen
  println("Current frame Rate is: " + frame_rate_value);
  println("mousePos is: " + mouseX, mouseY);
}



