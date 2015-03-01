
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
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
  background(180);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 5; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter
  int direction =0;

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      if (circleNumber % 2 == 0) {
        direction =-1;
      } 
      else {
        direction = 1;
      }

      movingCircle2(tx, ty, cellsize, direction * circleNumber * TWO_PI * millis() / 60000.0);
    }
  }
}//end of draw 

void movingCircle2(float x, float y, float size, float angle) {
  // calculate endpoint of the line
  float x1 = x + (size / 2) * sin(angle);
  float y1 = y + (size / 2) * cos(angle);
  float x2 = x + (size / 2) * sin(PI + angle - 45);
  float y2 = y + (size / 2) * cos(PI + angle - 45);
  float x3 = x + (size / 2) * sin(PI + angle + 45);
  float y3 = y + (size / 2) * cos(PI + angle + 45);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);

  if (angle > 0) {
    ellipse(x, y, size, size); // circle
  }
  else {
    rect(x, y, size, size);
  }

  ellipse(x1, y1, 5, 5); // circle
  stroke(255, 0, 0);
  fill(255, 0, 0, 180);
  triangle(x1, y1, x2, y2, x3, y3);
}



