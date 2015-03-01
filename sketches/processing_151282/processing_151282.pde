
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * 
 * Modified version by Martin Herbert - "Strive" - 11/06/14
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * 
 */

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(255,0,255);
  noStroke();

  int num = 12;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoints of the line
  float tempX1 = x + (size / 2) * sin(angle);
  float tempX2 = x - (size / 2) * sin(angle);
  float tempY1 = y + (size / 2) * cos(angle);
  float tempY2 = y - (size / 2) * cos(angle);

  strokeWeight(5);
  stroke(255-x/6, 255-y/6, 0);
  line(tempX1, tempY1, tempX2, tempY2); // yellow line
}



