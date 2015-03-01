
/*
 * Creative Coding
 * Week 2, 06 - Moving Patterns 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Similar to the previous sketch, this sketch draws a grid of oscillating circles. Each circle has a "lifetime"
 * over which it grows and changes intensity and opacity. At the end of each lifetime the circle begins again.
 * Pressing the left and right arrow keys changes the lifetime of all the circles globally.
 * 
 * Added Minim library to use the mic input for effects.
 */
 
// Minim audio initialization  
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioPlayer jingle;
FFT fft;
AudioInput in;
float[] angle;
float[] y, x;

// variable used to store the current frame rate value
int frame_rate_value = 19;
float gutter = 15;

void setup() {

  // make the display window the full size of the screen
  //size(displayWidth, displayHeight);
  size(800, 600);
  rectMode(CENTER);
  background(0);
  //Minim Setup
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048, 192000.0);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  y = new float[fft.specSize()];
  x = new float[fft.specSize()];
  angle = new float[fft.specSize()];
}


void draw() {

  background(0);
//println(in.right.level());
  int numX = 30;
  int numY = 20;
  int margin = 20;
  //float gutter = 0; //distance between each cell
  float cellsizeX = ( 800 - (2 * margin) - gutter * (numX - 1) ) / (numX - 1);
  float cellsizeY = ( 600 - (2 * margin) - gutter * (numY - 1) ) / (numY - 1);

  int circleNumber = 0; // counter
  for (int i=0; i<numX; i++) {
    for (int j=0; j<numY; j++) {
      circleNumber = (i * numX) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsizeX * i + gutter * i;
      float ty = margin + cellsizeY * j + gutter * j;

      movingCircle(tx, ty, cellsizeX, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;
  float circleSize = size * 2.0 * atan(circleAge * HALF_PI);
  
  //added in.right.level() and in.left.level() to change the colour of the stroke based on the input levels
  stroke(255, map(mouseX, 0, 800, 0, 255)*in.right.level(), map(mouseY, 0, 600, 0, 255)*in.left.level());
  strokeWeight(1);
  line(lerp(x-size/2, mouseX, in.right.level()), lerp(y-size/2, mouseY, in.left.level()), x-size/2, y-size/2);
  strokeWeight(2);
  stroke(255, lerp(255, 0, circleAge));
  //fill(lerp(128, 0, circleAge), map(mouseX, 0, width, 5, 255), map(mouseY, 0, height, 5, 255), lerp(120, 0, circleAge));
  fill(lerp(128, 0, circleAge), map(mouseX, 0, 800, 5, 255)*in.right.level(), map(mouseY, 0, 600, 5, 255)*in.left.level(), lerp(255, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize*in.right.level()*4, circleSize*in.left.level()*4);
  
}

void mouseDragged() {
  frame_rate_value = int(map(mouseX, 0, 800, 2, 50));
  gutter = map(mouseY, 0, 800, 0, 30);
  println("Current frame Rate is: " + frame_rate_value);
  println("Gutter is: " + gutter);
  println("MsX: " + mouseX);
  println("MsY: " + mouseY);
}

/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
//void keyReleased() {
//
//  // right arrow -- increase frame_rate_value
//  if (keyCode == RIGHT && frame_rate_value < 120) {
//    frame_rate_value++;
//  }
//
//  // left arrow -- decrease frame_rate_value
//  if ( keyCode == LEFT && frame_rate_value > 2) {
//    frame_rate_value--;
//  }
//
//  // print the current value on the screen
//  println("Current frame Rate is: " + frame_rate_value);
//}


