
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
  size(500, 500);
  background(220);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(220);
  noStroke();

  int num = 8;
  int margin = 20;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / num;
  int circleNumber = 0; // counter
  float circleShift = 0; // displacement

  for (int j=0; j<num; j++) {
    for (int i=0; i<num; i++) {
      ++circleNumber;
      circleShift = float(circleNumber)/5;
      println(circleNumber,circleShift);

      float tx = margin + cellsize/2 + cellsize * i + gutter * i;
      float ty = margin + cellsize/2 + cellsize * j + gutter * j;

      if(circleNumber%2==1) {
        movingCircle(tx, ty, cellsize, circleShift + 10 * TWO_PI * millis() / 70000.0);
      }
      else {
        movingSquare(tx, ty, cellsize, circleShift - 10 * TWO_PI * millis() / 140000.0);
      }
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

void movingSquare(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 90);
  rect(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}




