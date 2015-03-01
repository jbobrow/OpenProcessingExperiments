
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
  background(255);
  rectMode(CENTER);
  colorMode(HSB);
  noStroke();
}


void draw() {
  background(255);
  noStroke();

  int num = 40;
  int margin = 20;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, (width/2-tx) *(height/2-ty) * PI * millis() / 10000000.0);
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  //stroke(0);
  //strokeWeight(1);
  fill(tempX/2,tempY/2,75, 50);
  //ellipse(x, y, size, size); // circle

  //stroke(255, 0, 0);
  //line(x, y, tempX, tempY); // red line
  rect(tempX,tempY,25,25,15);
}



