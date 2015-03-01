
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
  size(800,600);

  frame_rate_value = 12;  // the number of times per second the draw() function is called.
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0);

  int num = 15;
  int margin = 20;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (3 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
  

   /////////////////////

    if (mousePressed && mouseX < width/2 && frame_rate_value < 120) { 
       frame_rate_value--;
    }
    
     if (mousePressed && mouseX > width/2 && frame_rate_value > 2) { 
       frame_rate_value++;
    }
 
 // print the current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
    //////////////////////

  
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

 /* 
 frame_rate_value becomes a cyclic period over which each circle grows. 
 At the end of each period it is ‘reborn’ and starts life all over again. 
 The current age of each circle is calculated using this period:
 */

  float circlePeriod = (float)frame_rate_value +80;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  strokeWeight(2);
  stroke(255, lerp(255, 0, circleAge));    
  fill(150,240,255, lerp(250, 0, circleAge));
  //lerp interpolates between two values based on a third value that varies between 0 and 1.
  
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
  
  fill(0, lerp(250, 0, circleAge));
  //lerp interpolates between two values based on a third value that varies between 0 and 1.
  ellipse(y-size/2, x-size/2, circleSize-60, circleSize-60);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 120) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 2) {
    frame_rate_value--;
  }
  
  // print the current value on the screen
  println("Current frame Rate is: " + frame_rate_value);
}



