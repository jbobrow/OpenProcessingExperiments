
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
 * revised by Stephanie Holcomb to change frame rate based on mouse location left/right , display
 * frame rate text and random color palette
 */

// variable used to store the current frame rate value
int frame_rate_value;
PFont f;
color[] rainbow = {#FFFFCD, #CC5C54, #F69162, #85A562, #7AB5DB};

void setup() {

  // make the display window the full size of the screen
  //size(displayWidth, displayHeight);
 size(800,800);
  frame_rate_value = 12;
  rectMode(CENTER);
  background(0);
  f=loadFont("Futura-Medium-66.vlw");
  
}


void draw() {
  //map function variablename= map(variable1, min1, max1, min2, max2);
  //map variable mousex - grab value between 0 and width of screen and give back min/max 0-120
  // to determine framerate
  frame_rate_value = (int)map(mouseX,0,width,2,120);
  background(0);

  int num = 60;
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
  
  textFont(f,66); // Step 4: Specify font to be used
  fill(255);        // Step 5: Specify font color
  
  // Step 6: Display Text
  text ( "Frame Rate:" + frame_rate_value ,10,100); 
  
  
  
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  strokeWeight(4);
  stroke(rainbow[int(random(1,5))], lerp(255, 0, circleAge));
  fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
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



