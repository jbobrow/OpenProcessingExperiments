
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
float pointX;
float pointY;

void setup() {
  size(500, 500);

  frame_rate_value = 6;
  frameRate(frame_rate_value);
  
  //rectMode(CENTER);
  rectMode(CORNER);
  
  background(0);
  //pointX = width / 2;
  //pointY = height / 2;
}


void draw() {
  updatePoint();
  background(200);

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
  size = size * 1.5;

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  float colR = tempX % 255;
  float colG = tempY % 255;
  float colB = (x * frame_rate_value + y) % 255;
  stroke(0);
  fill(colR, colG, colB);
  
  //rect(tempX, tempY, size/5, size/5);
  ellipse(tempX, tempY, size, size);
  //triangle(tempX, tempY, tempX + 5*size, tempY + 5*size, x, y);
  
  //rect(tempX, tempY, size*5, 1);
  stroke(0);
  //noFill();
  //stroke(0);
  //line(x, y, tempX, tempY);
  fill(colG, colR, colB);
  stroke(0);
  triangle(x, y, tempX, tempY, x + pointX, y + pointY);
  //triangle(x, y, tempX, tempY, pointX, pointY);
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

void updatePoint() {
  pointX = pointX + random(10) - 5;
  pointY = pointY + random(10) - 5;
}



