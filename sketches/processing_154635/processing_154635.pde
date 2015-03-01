
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
int total_num;
int move_me;

void setup() {
  size(800, 800);
  move_me = 1;
  total_num = 50;
  frame_rate_value = 24;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(255);
}


void draw() {

  background(255);

  int num = total_num;
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
  //float tempX = x + (size / 2) * sin(PI / frame_rate_value * (circleNum + move_me));
  //float tempY = y + (size / 2) * cos(PI / frame_rate_value * (circleNum + move_me));

  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);

  noFill();
  stroke(tempX,tempY/8,circleNum/50,50);
  //stroke(160,160,160,150);
  ellipse(x,y,size,size);
  
  noStroke();
  fill(tempX,tempY/8,circleNum/50);
  ellipse(tempX, tempY, size/5, size/5);
  fill(0);
  //rect(tempX, tempY, 1, size*2);
  stroke(0);
  //line(x, y, tempX, tempY);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyPressed() {

  // INCREASE
  if (keyCode == RIGHT && frame_rate_value < 60) {
    frame_rate_value++;
  }
  if (keyCode == UP) {
    total_num++;
  }

    
  // DECREASE
  if ( keyCode == LEFT && frame_rate_value > 1) {
    frame_rate_value--;
  }
  if (keyCode == DOWN) {
    total_num--;
  }
  
  // basically 'HIT PLAY'
  //if (key == 'a') {
  //  move_me = frameCount;
  //}
  
  // set the frameRate and print current value on the screen
  frameRate(frame_rate_value);
  println("Current frame Rate is: " + frame_rate_value + 
          ", speed is: " + move_me + ", number of particles is: " + total_num );
}
