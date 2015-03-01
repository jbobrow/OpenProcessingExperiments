
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
 */

// variable used to store the current frame rate value
int frame_rate_value;

void setup() {

  // make the display window the full size of the screen
  size(800,600);

  frame_rate_value = 12;
  rectMode(CENTER);
  background(#330534);
  smooth();
}


void draw() {

  background(#330534);

  int num = 20;
  int margin =10;
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
  
 mous();
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

 float pi=map(mouseY,0,height,0,TWO_PI);
  float circleSize = size * 2.0 * sin(circleAge * pi);

  strokeWeight(lerp(0,15, circleAge));
  stroke(255,10,100, lerp(255, 0, circleAge));
  fill(lerp(128, 0, circleAge),0,55, lerp(255, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}


/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void mous() {

  // right arrow -- increase frame_rate_value
  if ((mouseX > width/2)&&(frame_rate_value<25)){
       if (mousePressed) {
    frame_rate_value++;
       }}

  // left arrow -- decrease frame_rate_value
  if ( (mouseX < width/2 )&&(frame_rate_value>2)){
    if (mousePressed) {
    frame_rate_value--;
       }}
   

  
}
