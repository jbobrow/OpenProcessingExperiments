
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
int frame_rate_value = 19;
float gutter = 15;

void setup() {

  // make the display window the full size of the screen
  //size(displayWidth, displayHeight);
  size(600, 600);
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0);

  int num = 20;
  int margin = 0;
  //float gutter = 0; //distance between each cell
  float cellsize = ( 600 - (2 * margin) - gutter * (num - 1) ) / (num - 1);

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
  float circleSize = size * 2.0 * atan(circleAge * HALF_PI);
  
  stroke(255, map(mouseX, 0, 600, 0, 255), map(mouseY, 0, 600, 0, 255));
  strokeWeight(1);
  line(map(mouseX, 0, 600, 0, 600), map(mouseY, 0, 600, 0, 600), x-size/2, y-size/2);
  strokeWeight(2);
  stroke(255, lerp(255, 0, circleAge));
  //fill(lerp(128, 0, circleAge), map(mouseX, 0, width, 5, 255), map(mouseY, 0, height, 5, 255), lerp(120, 0, circleAge));
  fill(lerp(128, 0, circleAge), map(mouseX, 0, 600, 5, 255), map(mouseY, 0, 600, 5, 255), lerp(120, 0, circleAge));
  rect(x-size/2, y-size/2, circleSize, circleSize);
  
}

void mouseDragged() {
  frame_rate_value = int(map(mouseX, 0, 600, 2, 50));
  gutter = map(mouseY, 0, 600, 0, 30);
  println("Current frame Rate is: " + frame_rate_value);
  println("Gutter is: " + gutter);
  println("MsX: " + mouseX);
  println("MsY: " + mouseY);
}

/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
//void keyReleased() {
//
//  // right arrow -- increase frame_rate_value
//  if (keyCode == RIGHT && frame_rate_value < 120) {
//    frame_rate_value++;
//  }
//
//  // left arrow -- decrease frame_rate_value
//  if ( keyCode == LEFT && frame_rate_value > 2) {
//    frame_rate_value--;
//  }
//
//  // print the current value on the screen
//  println("Current frame Rate is: " + frame_rate_value);
//}



