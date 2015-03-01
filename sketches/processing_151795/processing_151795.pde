
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * Modified by Vanessa Lorenzo for the course Creative Code 2014
 *
 * This modified program draws a grid of circular and rectangular "clocks", whose hands move according to the elasped time, 
 * changing the direction of movement depending on if they are circles or rectangles.
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
  background(180);
  noStroke();

  int num = 5; //number of colums & rows 
  int margin = 80; // space between circles and the limit of the screen size

  float gutter = 5; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1); // cell size is equal to width minus 2 times the margin, minus gutter multiplied by num - 1, divided by num -1 (because there are 4 separators).

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i; // x coordinates for drawing circles along the columns
      float ty = margin + cellsize * j + gutter * j; // y coordinates for drawing circles along the rows
      if (circleNumber%2 == 0){ // if(circleNumber%2 == 0) is even, else is odd
      movingRectangle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0); // calling the function movingRectangle
      }
      else 
      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0); // calling the function movingCircle
    }
  }
}//end of draw 

void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

void movingRectangle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle); // to change direction of red lines cos and sen are swaped
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  rect(x, y, size, size); // rectangle
  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

