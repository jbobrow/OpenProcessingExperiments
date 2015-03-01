
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the arrow keys on your keyboard to change the
 * frame rate. 
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;
boolean bgFixed = true;
int bgBrightness = 255;

void setup() {
  size(500, 500);

  frame_rate_value = 6;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(bgBrightness);
}


void draw() {

  if (bgFixed) {
    background(bgBrightness);
  }
  
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


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  float tempRed = 128 + 127 * sin(PI / frame_rate_value * finalAngle);
  float tempGreen = 128 + 127 * cos(PI / frame_rate_value * finalAngle);
  float tempBlue = 128 - ((tempRed+tempGreen) / 2);
  float halfX = (x + tempX) / 2;
  float halfY = (y + tempY) / 2;
  float quarterX = (x + halfX) / 2;
  float quarterY = (y + halfY) / 2;
  float twoX = 2*x - halfX;
  float twoY = 2*y - halfY;

  noStroke();
  fill(tempRed, tempGreen, tempBlue);
  ellipse(halfX, halfY, size/2, size/2);
  fill(128,128);
  ellipse(quarterX, quarterY, size/4, size/4);
  fill(128,128);
  stroke(tempRed, tempGreen, tempBlue);
  ellipse(twoX, twoY, size/2, size/2);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}

void keyPressed() {
  if (key == 'k') {
    bgFixed = true;
    bgBrightness = 0;
  }
  else if (key == 'w') {
    bgFixed = true;
    bgBrightness = 255;
  }
  else if (key == 'n') {
    bgFixed = false;
  }
}


