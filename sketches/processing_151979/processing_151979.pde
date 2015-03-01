
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
int num;

void setup() {
  size(600, 600);
  num = 10;
  frame_rate_value = 6;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

  int margin = 0;

  
/*  for (int i=0; i<1000; i++) {
  num = (int) random(10,11); // ADDED CODE FOR RANDOM NUMBER OF ELEMENTS
  println ("NUM is now", num);
  } // end of FOR
*/

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  
  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber); 
 
    } // end of inner FOR
  } // end of outer FOR

}//end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  
  int colorNumber1;  // ADDED CODE / make color random and change the shape 
  int colorNumber2; 
  int colorNumber3;

  colorNumber1 = (int) random(1,999);  // ADDED CODE, RANDOM COLOR
  colorNumber2 = (int) random(1,999); 
  colorNumber3 = (int) random(1,999); 


  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(colorNumber1, colorNumber2, colorNumber3, 150);
  ellipse(tempX, tempY, size/5, size/5);  // RECT changed to ellipse
  ellipse(tempX, tempY, 1, size*5);
  stroke(0);
  noFill();
  stroke(0);
  line(x, y, tempX, tempY);
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

  // up arrow -- increase num value
  if (keyCode == UP && num < 30) {
    num++;
  }

  // down arrow -- decrease num value
  if (keyCode == DOWN && num >5) {
    num++;
  }
  
  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate en NUM is: " +  num);
}



