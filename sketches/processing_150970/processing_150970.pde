
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
  size(600, 600);
  noStroke();
  noFill();

  frame_rate_value = 30;
  frameRate(frame_rate_value);
}


void draw() {

  background(0);
  
  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  int circleNumber2 = 0; // another counter
  for (int i=0; i<num/2; i++) { // NEW NEW NEW 'num/2' I'm only drawing half the width as I'm repeating it with symmetry
    for (int j=0; j<num/2; j++) { // NEW NEW NEW 'num/2' I'm only drawing half the width as I'm repeating it with symmetry
      circleNumber = (i * (num/2)) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize*4, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);
  float tempX2 = x + (size / 2) * cos(PI / frame_rate_value * finalAngle); // NEW NEW NEW Swapped sin() for cos()
  float tempY2 = y + (size / 2) * sin(PI / frame_rate_value * finalAngle); // NEW NEW NEW Swapped cos() for sin()

  // NEW NEW NEW - I replaced the line() and rect() commands with ellipses and mirrored
  //               the top left portion to the top right, bottom right and bottom left   
  float sx = sin( map( tempX, 0, width, 0, PI) );
  float sy = sin( map( tempY, 0, height, 0, PI) );
  float xy = sx * sy;
  float diameterX = xy * 50;
  float diameterY = diameterX;
  
  int transparency = 128;

  fill(#f2db72, transparency); //browm
  ellipse(tempX, tempY, diameterX, diameterY);
  ellipse(width-tempX, tempY, diameterX, diameterY);
  ellipse(tempX, height-tempY, diameterX, diameterY);
  ellipse(width-tempX, height-tempY, diameterX, diameterY);

  fill(#faaf5a, transparency); //green
  ellipse(tempX2, tempY2, diameterX, diameterY);
  ellipse(width-tempX2, tempY2, diameterX, diameterY);
  ellipse(tempX2, height-tempY2, diameterX, diameterY);
  ellipse(width-tempX2, height-tempY2, diameterX, diameterY);

  fill(#c282b0, transparency);
  ellipse(tempY, tempX, diameterX, diameterY);
  ellipse(width-tempX, tempY, diameterX, diameterY);
  ellipse(tempY, height-tempX, diameterX, diameterY);
  ellipse(width-tempY, height-tempX, diameterX, diameterY);

  fill(#e8a2d8, transparency);
  ellipse(tempY2, tempX2, diameterX, diameterY);
  ellipse(width-tempY2, tempX2, diameterX, diameterY);
  ellipse(tempY2, height-tempX2, diameterX, diameterY);
  ellipse(width-tempY2, height-tempX2, diameterX, diameterY);
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
  //frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}



