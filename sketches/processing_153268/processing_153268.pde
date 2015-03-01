
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
  //frameRate(1);
}

void draw() {
  background(180);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num-1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      if ((circleNumber%2+1)==1) {
        movingSquare(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      } // end of if circleNuimber
      else {
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      } //end of else
    }
  }
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("john_f_gee.jpg");
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

void movingSquare(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y - (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  rect(x, y, size, size); // draws a square

    stroke(255, 255, 0);
  line(x, y, tempX, tempY); // red line
}



