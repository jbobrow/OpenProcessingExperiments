
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
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(#FFD373);

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
  
  float normalisedAngle = (sin(PI / frame_rate_value * finalAngle) + 1) / 2;
  
  noStroke();
  
  //interpolated between light yellow and turquoise based on angle
  fill(175+(normalisedAngle*80), 238+(normalisedAngle*17), 238-(normalisedAngle*85));
  
  //draw a zig-zag triangle strip at temp position
  drawWiggleShape(tempX, tempY, size);
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

/*
* Draw a zigzag triangle strip at position x and y for specified cell size.
*/
void drawWiggleShape(float x, float y, float size) {
  beginShape(TRIANGLE_STRIP);
  float yExtent = 3.5;
  
  vertex(x, y-(size*yExtent));
  
  while (yExtent > -3.5) {
    yExtent -= 0.5;
    vertex(x-(size*0.25), y-(size*yExtent));
    vertex(x, y-(size*yExtent));
    yExtent -= 0.5;
    vertex(x+(size*0.25), y-(size*yExtent));
    vertex(x, y-(size*yExtent));
  }
  
  yExtent -= 0.5;
  vertex(x, y-(size*yExtent));
  endShape();
  
}



