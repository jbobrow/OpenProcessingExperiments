
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
 * Move left and right to set framerate
 * Move up and down to set H of HSB colour space
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;
int colHVal;

void setup() {

  // make the display window the full size of the screen
  //size(int(displayWidth*.75), int(displayHeight*.75));
  size(800,800);

  frame_rate_value = 12;
  rectMode(CENTER);
  background(0);
  colorMode(HSB);
}


void draw() {
  
  background(0);
  frame_rate_value =int(map(mouseX,0,width,1,120));
  colHVal =int(map(mouseY,0,height,1,360));
  
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
  
  //nb: hsb is usally 360, 100, 100 
  //but processing uses 255 as default max for S and B
  stroke(colHVal, 255, lerp(200, 0, (circleAge)));
  fill(colHVal, 255, lerp(255, 0, (circleAge)));
  
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}





