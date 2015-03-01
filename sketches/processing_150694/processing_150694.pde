
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

  frame_rate_value = 9;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  //background(185,185,185);
  background(255);

  int num = 20;
  int margin = 0;
  float gutter = 18; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  float circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      //circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      circleNumber =num*i+j;

      float tx =  cellsize * i + gutter * i;
      float ty =  cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, float circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX =(size/2 ) * sin(PI / frame_rate_value * finalAngle);
  float tempY = (size/2 ) * cos(PI / frame_rate_value * finalAngle);

 stroke(0);

  noStroke();
  fill(0);
  ellipse(x-3*tempY+tempX,y-3*tempX+tempY,3*size,3*size);
  fill(255); 
  ellipse(x+6*tempX,y+6*tempY,2*size,2*size);
  noFill()
  strokeWeight(5);
  stroke(255,0,0);
  line(x-3.5*tempY+tempX,y-3.5*tempX+tempY,x+6*tempX,y+6*tempY);
  //ellipse(x-1.5*tempY+3.5*tempX,y-1.5*tempX+3.5*tempY,2*size,2*size);
  //ellipse(x,y,size,size);
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
