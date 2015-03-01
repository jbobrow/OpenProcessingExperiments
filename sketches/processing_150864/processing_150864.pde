
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
int counter; 

void setup() {
  size(500, 500);

  frame_rate_value = 13;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);

  counter = 0;
}


void draw() {
  /*
  if (counter >= frame_rate_value) {
    background(255);
    counter = 0;
  }
  counter++; 
  */
    
  noStroke(); 
  fill(255, 20); 
  rect(width/2, height/2, width, height); 
    
  
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
  float r = 95; 
  float g = 1; 
  float b = 25; 
  
  float finalAngle;
  finalAngle = frameCount + circleNum;
  
  float angle = PI / frame_rate_value * finalAngle;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size) * sin(angle);
  float tempY = y + (size) * cos(angle);

  fill(0); 
  ellipse(tempX, tempY, 5, 5); 

  r += random(-45, 45); 
  g += random(-45, 45);
  b += random(-45, 45);

  noFill();
  strokeWeight(3); 
  stroke(r, g, b, 100);
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

  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value);
}



