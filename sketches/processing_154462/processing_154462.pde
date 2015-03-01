
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
  
  size(600, 600);
  frame_rate_value = 16;
  rectMode(CENTER);
  background(0);
  frameRate(5);
}

void draw() {

  background(220);
  int num = 17;
  int margin = 0;
  float gutter = 15; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 1; // counter
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

  float circleSize = size * 10.0 * sin(circleAge * HALF_PI);
  
  float R = map (mouseX/2, 0, width, 20, 220);
  float G = map (mouseX/2, 0, width, 50, 220);
  float B = map (mouseX/2, 0, width, 50, 220);

  strokeWeight(0.5);
  stroke(lerp(R,0,circleAge),lerp(G,0,circleAge),lerp(B,0,circleAge),lerp(100,0,circleAge));
  fill(R,G,B, lerp(1,40, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}

void mouseDragged() {
 float x = map (mouseX, 0, width, 2, 120);
 frame_rate_value = (int)x / 5;
 if(frame_rate_value==0) {
 frame_rate_value =2;
 }
 println("Current frame Rate is: " + frame_rate_value);
}
