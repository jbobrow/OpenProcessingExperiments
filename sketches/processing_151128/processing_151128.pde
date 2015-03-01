
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
float rotateAngle = 0;

void setup() {
  size(600, 600, P3D);
  noStroke();
  colorMode(HSB);
  sphereDetail(10);

  frame_rate_value = 14;
  frameRate(30);
}


void draw() {

  spotLight(0,0,255,0,0,50,0,0,0,PI/2,10000);
  lights();
  background(0);//40, 128, 96);

  int num = 30;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  int circleNumber = 0; // counter

  pushMatrix();
  translate(width/2, height/2);
  scale(1.3);
  rotateAngle+= TWO_PI/360;
  rotate(rotateAngle);
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      movingCircle(tx, ty, cellsize, circleNumber);
    } // end of for(j)
  } // end of for(i)
  popMatrix();
} //end of draw 


void movingCircle(float x, float y, float size, int circleNum) {

  float finalAngle;
  finalAngle = frameCount + circleNum;

  //the rotating angle for each tempX and tempY postion is affected by frameRate and angle;  
  float tempX = x + (size / 2) * sin(PI / frame_rate_value * finalAngle);
  float tempY = y + (size / 2) * cos(PI / frame_rate_value * finalAngle);


  float waveHeight = map( tempX-x, -14, 14, -20, 20);
  float c = map( waveHeight, -20, 20, 64, 255);
  int f = (int) map(tempY,0,height,0,255);
  fill(max(f,0), 255, c);

  pushMatrix();
  translate(tempX-width/2, tempY-height/2, waveHeight);
  sphere(size/2);
  popMatrix();
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



