
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

void setup() {
  size(500, 500);

  frame_rate_value = 60;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(185,185,185);

  int num = 30;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  float circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      //circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      circleNumber =-i-j;

      float tx =  cellsize * i + gutter * i;
      float ty =  cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, float circleNum) {

  float finalAngle;
  finalAngle = frameCount + 2*circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX =(size/2 ) * sin((x%4)*PI / frame_rate_value * finalAngle);
  float tempY = (size/2 ) * cos(4*PI / frame_rate_value * finalAngle);

 stroke(0);

  noStroke();
  fill(255,0,0,100);
  ellipse(x+tempX,y+tempY,size,size);
  fill(0,255,0,100);
  ellipse(x-tempX,y-tempY,size,size);
  fill(0,0,255,100);
  ellipse(x+tempY,y+tempX,size,size);
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

