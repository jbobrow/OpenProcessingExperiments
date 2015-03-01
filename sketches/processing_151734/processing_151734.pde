
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
 * Added clour gradient - how to return array from function
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);

  frame_rate_value = 20;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

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
  int [] defCols = {120, 120, 120};
  
  noStroke();
  fill(0);
  
  int [] colourVar=useColourGradient( defCols, .1,.2,.3,10,20,30,128,127,circleNum);
  
  stroke(colourVar[0],colourVar[1], colourVar[2], 180);
  noFill();
  ellipse(tempX, tempY, size/3, size/3);
  
  fill(colourVar[0],colourVar[1], colourVar[2], 130);
  ellipse(tempX, tempY, size/2, size/2);
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


int[] useColourGradient(int [] cVals, float frequency1, float frequency2, float frequency3,
                             int phase1, int phase2, int phase3,
                             int center, int mcgwidth, int thisCircle)
  {
    
    if (center <= 0)   center = 128;
    if (mcgwidth <= 0)    mcgwidth = 127;
    
    int red = int(sin(frequency1*thisCircle + phase1) * mcgwidth + center);
    int grn = int(sin(frequency2*thisCircle + phase2) * mcgwidth + center);
    int blu = int(sin(frequency3*thisCircle + phase3) * mcgwidth + center);
   
    cVals[0]=red;
    cVals[1]=grn;
    cVals[2]=blu;

    return cVals;
  }


