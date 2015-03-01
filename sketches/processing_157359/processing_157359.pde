
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * Adapted as an exercise by Jessica Cheeseman 
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
  size(600, 600);

  frame_rate_value = 130;
  rectMode(CENTER);
  background(50);
}


void draw() {

  background(150);

  int num = 10;
  int margin = 0;
  float gutter = -5; //distance between each cell
  float cellsize = ( width - (1 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=1; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (j * num) + i; // different way to calculate the circle number from w2_04

      float ty = margin + cellsize * i + gutter * i;
      float tx = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 3.0 / sin(circleAge * PI);

  strokeWeight(2);
  stroke(255, lerp(255, 0, circleAge));
  fill(lerp(100, 100, circleAge), lerp(100, 100, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}


 /* mouse controls
 */ 
 void mouseClicked(){

// left click -- decrease frame_rate_value 
 if (mouseX <= width/2 && frame_rate_value > 25){ 
 frame_rate_value--; 
 } 

 // right click -- increase frame_rate_value 
 if (mouseX > width/2 && frame_rate_value < 300){ 
 frame_rate_value++; 
 } 

 // print the current value on the screen 
 println("Current frame Rate is: " + frame_rate_value); 

}

