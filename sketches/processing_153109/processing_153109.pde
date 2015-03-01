
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
int redIntensity;
int blueIntensity;
void setup() {
  size(500, 500);

  frame_rate_value = 12;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255,215,103);
}


void draw() {

 // background(255);
  blueIntensity = 210;
  redIntensity = 210;
  int num = 10;
  int margin = 30;
  float gutter = 15; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / num;
  //  println(cellsize);
  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      //   println("circleNumber IS "+ circleNumber);
      float tx = margin + cellsize/2 + cellsize * i + gutter * i;
      float ty = margin + cellsize/2 + cellsize * j + gutter * j;
      blueIntensity = 200 - 2*circleNumber;
      redIntensity = 200 - 2*( 100 - circleNumber);
      //    print ("  blueIntensity = " + blueIntensity + "    ");
      movingCircle(tx, ty, cellsize, circleNumber, blueIntensity, redIntensity);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum, int blueInt, int redInt) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  noStroke();
  fill(255,191,13);
  rect(tempX, tempY, 2, size*2);  //rectangle whose width varies from zero to max twice in one cycle
  //stroke(0);
  
  noFill();
  stroke(255, 0, 0);
  line(x, y, tempX, tempY);
  
  strokeWeight(2);
  stroke(255, redInt, redInt);
  fill(blueInt, blueInt, 255);
  //  print(blueInt +"    ");
  ellipse(tempX, tempY, size/2, size/2);  //little circle on the end of the rotatingline
  noFill();
  stroke(150, 255, 150);
  strokeWeight(1);
  // fill(0, 255, 0);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value = frame_rate_value + 10;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value = frame_rate_value - 10;
  }

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}



