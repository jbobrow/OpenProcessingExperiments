
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * tweaked by Neroli Wesley
 * Copyright (c) 2014 Monash University
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;
int num;

void setup() {

  // make the display window the full size of the screen
  size(1500, 1500);
  frameRate(12);
  frame_rate_value = 12;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(#1E368B);
 
  num = 30;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  //float cellsize = ( width - (2 * margin) - gutter * (num - random(50)) ) / (num + random(33));//freaky bg size change
  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i + random(100);
      float ty = margin + cellsize * j + gutter * j + random(50);

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNumber) { // circleNumber is used as the Offset

  float circlePeriod = (float)frame_rate_value*10;
//  float circleAge = (float)((frameCount) % (int)circlePeriod) / circlePeriod;
  // is the following just a way to get a small number dependent on framecount and frame rat for each circle?
  // for lerp the amt argument must be between zero and 1
  float circleAge = (float)((frameCount + circleNumber) % (int)circlePeriod) / circlePeriod;
  //println(circleAge);
  float circleSize = size * 2.0 * sin((circleAge + random(100)) * HALF_PI);
  // initial strokeWeight
  strokeWeight(1);
  //lerp() Calculates a number between two numbers at a specific increment. The amt parameter is the amount to interpolate between the two values where 0.0 equal to the first point, 0.1 is very near the first point, 0.5 is half-way in between, etc. The lerp function is convenient for creating motion along a straight path and for drawing dotted lines.

  // stroke weight decreases as circleAge so it goes from black to white over the period of the circle's life
  //stroke(255, lerp(255, 0, circleAge));
  // or stroke is red with an increasing alpha calculated using the range 255 to 0 ie. opaque to transparent as a function of circleAge
  stroke(#141879, lerp(255, 0, circleAge));
  // so this is fill colour based on a lerp bw 128 and zero changing amt as circleAge
  // and transparency based on lerp bw 120 and zero based on amt, circleAge
  // so the gray and the transparency changes (decreases) as eash circle ages.
  //fill(lerp(#3A22C6, #615E71, circleAge), lerp(120, 0, circleAge));
  // so try lerpColor(fromColor, toColor, amount) interpolation
  // syntax fill(lerpColor(from,to,amt),gray);
  color fromColor = color(25,131,56);
  color toColor = color(94,104,193);
  //fill(lerp(fromColor, toColor, circleAge), lerp(120, 0, circleAge));
  fill(lerpColor(fromColor, toColor, circleAge), 170);//, lerp(120, 0, circleAge));
 // fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}

// mouse interaction
void mouseDragged(){
  //println("The mouse is being dragged");
  if (num < 50) {
  frame_rate_value++; 
  }
}
void mouseReleased() {
  saveFrame("capture-##.jpg");
  //println("The mouse button was released");
  frame_rate_value = 12;
}
