

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
 
 /*
 * From the workshop at Monash University in FutureLearn
 * Adjustemets by Pablo Rosero
 * www.pablorosero.com
 */
 



// variable used to store the current frame rate value
float frame_rate_value = 10;
float t = 0.0;
void setup() {

  // make the display window the full size of the screen
  size(900, 900);

  frame_rate_value = 12;
  rectMode(CENTER);
  background(0);
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, 900*2, 900*2);
  
  translate(900/2, 900/2);
  scale(0.5);
  rotate(t);
  t += map(mouseY, 0, 900, 0, 0.05);
  myShape();
}


void myShape() {



  frame_rate_value = map(mouseX, 0, 900, 120, 200);

  int num = 2;
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


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;
  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);

  float aSize = size * 2 * cos(circleAge * map(mouseY, 0, 900, TWO_PI, 0));
  
  strokeWeight(3);
  stroke(255, 224);
  noFill();

  rect(x-size/2, y-size/2, circleSize+aSize, circleSize+aSize);
  ellipse(x-size/2, y-size/2, circleSize-20, circleSize-20);
  
}


