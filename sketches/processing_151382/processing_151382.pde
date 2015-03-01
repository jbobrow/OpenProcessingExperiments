
/*
 * Creative Coding
 * Week 2, 04 - The Clocks!
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *version by Andy Gray
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 *
 * Updated version: this updated version correctly sets margin and gutter distances
 * this instance has alternating clocks and squares. Squares change colors randomly
 */

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int num = 5;  // the number of rows and columns
  int margin = 40; // margin between the edges of the screen and the circles

  float gutter = 10; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / num; // size of each circle

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) { // column in y
    for (int j=0; j<num; j++) { // row in x
      ++circleNumber;

      float tx = margin + cellsize/2  + (cellsize + gutter) * j;
      float ty = margin + cellsize/2  + (cellsize + gutter) * i;
      if (circleNumber % 2 == 0) {
                movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);//circles
    }
    else if (circleNumber % 2 == 1) {
                movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);//squares
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
  fill(random(255),random(255),random(255), 180);
  ellipse(x, y, size, size); // circle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}
void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x - (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  rect(x, y, size, size); // rectangle

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}



