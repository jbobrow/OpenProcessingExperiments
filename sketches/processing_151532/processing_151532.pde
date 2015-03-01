
/*
 * Creative Coding
 * Week 2, 05 - Moving Patterns 1
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch builds on the previous sketches, drawing shapes based on the
 * current framerate. The movement of individual shapes combine to create a
 * gestalt field of motion. Use the mouse to change the
 * frame rate. 
 * 
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {
  size(1000, 800);

  frame_rate_value = 14;
  frameRate(frame_rate_value);
  rectMode(CENTER);
  background(2,2,2);
}


void draw() {

  //background(2,2,2);

  int num = 30;
  int margin = -10;
  float gutter = -30; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
        
      stroke(ty, tx, 100);
      fill(tx/3,ty/4,90);
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

  ellipse(tempX, tempY, size, size);
 
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void mouseClicked() {
 if ( frame_rate_value == 14) {
    frame_rate_value = 17;
  }
  else if ( frame_rate_value == 17) {
    frame_rate_value = 39;
}
  else if (frame_rate_value == 39) {
    frame_rate_value = 30;
}
else if (frame_rate_value == 30) {
    frame_rate_value = 18;
}
else if (frame_rate_value == 18) {
    frame_rate_value = 13;
}
else if (frame_rate_value == 13) {
    frame_rate_value = 14;
}

}



