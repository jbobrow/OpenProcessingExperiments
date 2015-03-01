
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

  frame_rate_value = 11;
  frameRate(60);
  rectMode(CENTER);
  background(255);
  //colorMode(HSB);
}


void draw() {

  background(255);

  int num = 20; // number of circles
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber,0);
    }
      // save your drawing when you press keyboard 's'
  
    //saveFrame("s2_05_02-##.tga");
  

  }
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber,PI);
    }
      // save your drawing when you press keyboard 's'
  
    //saveFrame("s2_05_02-##.tga");
  

  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum,float phase) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(phase+PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(phase+PI / frame_rate_value * finalAngle);

  noStroke();
  //fill(x*circleNum,y,x);
  //rect(tempX, tempY, size/2, size/2);
  fill(255-phase*50,phase*y/2,x*circleNum/200,100);
  //rect(tempX, tempY, 1, size*5);
  //stroke(255);
 // noFill();
  //stroke(0);
  //line(x, y, tempX, tempY,120);
  ellipse(tempX, tempY, size+1, size);
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

