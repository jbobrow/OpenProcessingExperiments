
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Modified by Jason Prine June 10, 2014:
 ***** mouse scroll wheel to change size of circles
 ***** pulsing margin
 ***** keyboard colour mixer; q/w for R, a/s for G, z/x for B (B IS DONE WITH LERP)
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 */

//global variables
  float frame_rate_value; // variable used to store the current frame rate value
  int mouseFactor = 2;   // variable to track mouse scroll value
  float margin = 50;  //distance from edges of display window
  boolean pulse = false; //for determinig if margin is to grow outwards or shrink inwards
  float gutter = 10; //distance between each cell

// variables for colour mixer
  int strokeValueR = 255;
  int strokeValueG = 0;
  int strokeValueB = 0;
  int increment = 5;

void setup() {

  // make the display window the full size of the screen
  size(500,500);
  frame_rate_value = 60;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0);

  int num = 5; //number of circles
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

// pulsing margin
      if (pulse == false) {
        margin=margin+.1;
      } else {
        margin=margin-.1;  
      }
      
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);

// set if the margin is growing outwards or shrinking inwards
      if (margin > 200) {
        pulse = true; // make the margin shrink in above pulsing margin IF
      } else if (margin < 0) {
        pulse = false; // make the margin grow in above pulsing margin IF
      }
    }
  }

} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);
  println ("circlePeriod:", circlePeriod, "circleAge:", circleAge, "circleSize:", circleSize, "mouseFactor:", mouseFactor); //debugging
  println ("R:",strokeValueR,"G:",strokeValueB,"B:",lerp(0, 255, circleAge),"Increment:",increment); //colour mixer debugging
  println ("margin:",margin);
  strokeWeight(2);
  stroke(strokeValueR, strokeValueG, lerp(0, 255, circleAge));
  fill(lerp(mouseFactor, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase gutter
  if (keyCode == RIGHT) {
    margin = constrain(gutter + 5, 0, 50);
  }

  // left arrow -- decrease gutter
  if ( keyCode == LEFT) {
    margin = constrain(gutter - 5, 0, 50);
  }

///colour mixer added by JP
  if (key  == 'q') {
      strokeValueR = strokeValueR + increment;
    } 
    
  if (key == 'w') {
      strokeValueR = strokeValueR - increment;
    } 
    
  if (key == 'a') {
      strokeValueG = strokeValueG + increment;
    } 
    
  if (key == 's') {
      strokeValueG = strokeValueG - increment;
    } 
 
 /* not in use but could be - using lerp to determine B value   
  if (key == 'z') {
      strokeValueB = strokeValueB + increment;
    } 
    
  if (key == 'x') {
      strokeValueB = strokeValueB - increment;
    }
*/

 // ensure storkeValue is constrianed between 0 and 255
  strokeValueR = constrain(strokeValueR,0,255);
  strokeValueG = constrain(strokeValueG,0,255);
  strokeValueB = constrain(strokeValueB,0,255);

}

void mouseWheel(MouseEvent event) {
  mouseFactor = constrain(mouseFactor + event.getCount(), 20, 255);
  println(mouseFactor);
}

