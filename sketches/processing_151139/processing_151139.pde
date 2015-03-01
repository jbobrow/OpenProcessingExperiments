
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
 * by P bailey exercise wk2 exercise 5.
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(500, 500);

  frame_rate_value = 6;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);
 
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
      
      
if ( (circleNumber % 2) == 0) {
    color R=color(random(255),random(255),random(255));
  color B=color(random(255),random(255),random(255));
  color G=color(random(255),random(255),random(255));
      movingCircle(tx, ty, cellsize, circleNumber,R,B,G);
      
     }
 
        else
        {   
      
  color R=color(random(255),random (255),random(255));
  color B=color(random(255),random(255),random(255));
  color G=color(random(255),random(255),random(255));
      movingCircle2(tx, ty, cellsize, circleNumber,R,B,G);
      println(circleNumber);
    }     
      
      
      
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum, color R, color B, color G) {

  float finalAngle;
  finalAngle = frameCount + circleNum;
println(finalAngle);
  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(R);
  rect(tempX, tempY, size/5, size/5);
  fill(B);
  ellipse(tempX, tempY, 1, size*5);
  
  
  
  
  
  
  stroke(0);
  //noFill();
  stroke(R,G,B);
  
  line(x, y, tempX, tempY);
}
void movingCircle2(float x, float y, float size, int circleNum, color R, color B, color G) {

  float finalAngle;
  finalAngle = frameCount + circleNum *-1;
println(finalAngle);
  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noStroke();
  fill(R);
  rect(tempX, tempY, size/5, size/5);
  fill(B);
  ellipse(tempX, tempY, 1, size*5);
  
  
  
  
  
  
  stroke(R,G,B);
  //noFill();
  stroke(R,G,B);
  
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
