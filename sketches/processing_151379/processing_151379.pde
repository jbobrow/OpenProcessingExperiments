
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
int shape;
int circleNumber;

void setup() {

  // make the display window the full size of the screen
  //size(displayWidth, displayHeight);
  size(800, 600);
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

  circleNumber = 0; // counter
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
  stroke(255, lerp(255, 0, circleAge));
  fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge));
  // here we switch the shape between circle, rectangle and triangle
  shape = circleNumber % 3;
  switch(shape) {
    case 0:
      ellipse(x-size/2, y-size/2, circleSize, circleSize);
      break;
    case 1:
      rect(x-size/2, y-size/2, circleSize, circleSize);
      break;
    case 2:
      triangle(x-size/2, y-size/2 - circleSize/2, x-size/2 + circleSize/2, y-size/2 + circleSize/2, x-size/2 - circleSize/2, y-size/2 + circleSize/2);
      break;
    default:
      ellipse(x-size/2, y-size/2, circleSize, circleSize);
      break;
  }
}

void mouseDragged() {
  frame_rate_value = int(map(mouseX, 0, displayWidth, 2, 120));
  println("Current frame Rate is: " + frame_rate_value);
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



