
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

  //background(255);
  background(frame_rate_value * 3);

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

  // play with these to change the output
  float elsize = size;
  float elred = circleNum + (frame_rate_value);
  float elgreen = circleNum / 2;
  float elblue = circleNum / frame_rate_value;
  float elgam = 180;

  // circle
  noStroke();
  fill(elred, elgreen, elblue, elgam);
  ellipse(tempX, tempY, elsize , elsize);
  
  // play with this to get different surround shapes
  int sides = frame_rate_value + 3; 
  float radian = TWO_PI/sides;
  float ssred = elred;
  float ssgreen = circleNum - second();
  float ssblue = circleNum + second();
  float ssgam = second() + 100;
  
  // surround shape
  beginShape();
  fill(ssred, ssgreen, ssblue, ssgam);
  for (int i = 0; i < sides + 1; i++) {
    float ox = tempX + size * cos(radian/2 + radian * i);
    float oy = tempY + size * sin(radian/2 + radian * i);
    vertex(ox, oy); 
  }
  endShape(CLOSE);

  // line and square
  fill(0);
  rect(tempX, tempY, size/5, size/5);
  noFill();
  stroke(1);
  line(x - 10, y - 10, tempX, tempY);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // exit
  if (key == 'q') {
    exit();
  }
  
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



