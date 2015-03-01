
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * frame_rate_value you use the mouseX to do change its value
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {

  // make the display window the full size of the screen
  //size(displayWidth, displayHeight);
  size(500, 500);

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
  
  // frame_rate_values -> (mouseX)
  if (mouseX <= width/2) {
    frame_rate_value = int(map(mouseX, 0, width/2, 2, 60));
   } 
   if (mouseX > width/2) {
     frame_rate_value = int(map(mouseX, width/2, width, 60, 120));
   }

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
  println(frame_rate_value);
} //end of draw


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod; //Cicles

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  strokeWeight(2);
  stroke(255, lerp(255, 0, circleAge));
  fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}
