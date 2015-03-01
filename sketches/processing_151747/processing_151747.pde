
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
  size(500, 500);

  frame_rate_value = 20;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0);

  int num = 20;
  int margin = 0;
  float gutter = -10; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;


      movingCircle(tx, ty, cellsize, circleNumber);
     // movingCircle2(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


 
void movingCircle(float x, float y, float size, int circleNum) {
 
  float finalAngle;
  finalAngle = frameCount + circleNum;
 
  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle; 
  float tempX = x + (size / 2) * 1.1* sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * 1.1 *cos(PI / frame_rate_value * finalAngle);
  int [] defCols = {120, 120, 120};
   
  noStroke();
  fill(0);
   
  int [] cVar=useGradient( defCols, .1,.2,.3,50,70,90,128,127,circleNum);
   
  stroke(cVar[2],cVar[1], cVar[0], 220);
 
  fill(cVar[0],cVar[1], cVar[2], 120);

  rect(tempX, tempY, size*1.8, size*1.2, 16);
  
  rect(tempX*1.2, tempY*(1.4), size*1.8, size*2, 20);
  
   
  
}



/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 70) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 8) {
    frame_rate_value--;
  }
}
int[] useGradient(int [] cVals, float frequency1, float frequency2, float frequency3, int phase1, int phase2, int phase3,int center, int mcgwidth, int thisCircle)
  {
     
    if (center <= 0)   center = 128;
    if (mcgwidth <= 0)    mcgwidth = 127;
     
    int red = int(cos(frequency1*thisCircle + phase1) * mcgwidth + center);
    int grn = int(cos(frequency2*thisCircle + phase2) * mcgwidth + center);
    int blu = int(cos(frequency3*thisCircle + phase3) * mcgwidth + center);
    
    cVals[0]=red;
    cVals[1]=grn;
    cVals[2]=blu;
 
    return cVals;
  }




