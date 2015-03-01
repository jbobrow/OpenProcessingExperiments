
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

  size(800, 800);
  background(0);
  smooth();
  colorMode(HSB, 360, 100, 100);
  
  frame_rate_value = 19;
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
      
      if (keyPressed == true && key=='s') {  // save your drawing when you press keyboard 's'
          saveFrame("pattern.png");
      }

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);
  
  strokeWeight(1);
  stroke(50);
  noFill();
  ellipse(x, y, circleSize, circleSize);
  
  strokeWeight(2);
  stroke(100, lerp(255, 0, circleAge));
  
  float colour = map(mouseX, 0, width, 0, 360);    // maping the change of colour with the mouseX position
  float opacity = map(mouseY, 0, height, 50, 200);    // maping the change of opacity with the mouseY position
  fill(colour, lerp(50, 100, circleAge), lerp(50, 100, circleAge), opacity);
  ellipse(x, y, circleSize, circleSize);

  if (mouseButton == CENTER) {    // make the screen black until the mouse moves again
   background(0);
  }
}

void mousePressed() {
  
    if (mouseButton == LEFT) {  // left mouse button -- increase frame_rate_value
      frame_rate_value++;
  }  else if (mouseButton==RIGHT) {   // right mouse button -- decrease frame_rate_value
      frame_rate_value--;
  }    // print the current value on the screen
     println("Current frame Rate is: " + frame_rate_value);
  }


