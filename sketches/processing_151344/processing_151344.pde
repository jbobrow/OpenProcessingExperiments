
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
  background(#FAFAA9);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  //float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / num;
  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      //float tx = margin + cellsize * i + gutter * i;
      //float ty = margin + cellsize * j + gutter * j;
      float tx = margin + cellsize / 2 + cellsize * i + gutter * i; 
      float ty = margin + cellsize / 2 + cellsize * j + gutter * j;
      float evens = circleNumber%2;
      println(evens);
      if (evens == 1) { 
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
        } else {
        movingCircle2(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0); 
        } 
      }    
  }
}//end of draw 

void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(5);
  fill(#14811A, 180);
  rect(x, y, size, size); // square

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}
void movingCircle(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(255,0,0, 180);
  ellipse(x, y, size+10, size+10); // circle
  fill(#B7E8B9, 180);
  ellipse(tempX, tempY, size, size); // circle
  stroke(0,255, 0);
  line(x, y, tempX, tempY); // red line
}



