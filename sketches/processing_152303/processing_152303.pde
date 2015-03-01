
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
 
 /*
 * From the workshop at Monash University in FutureLearn
 * Adjustemets by Pablo Rosero
 * www.pablorosero.com
 */




void setup() {
  size(600, 600);
  background(255);
  rectMode(CENTER);
}


void draw() {
  background(255);


  int num = 10;
  int margin = 40;

  float gutter = 2.5; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber+=1;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      if (circleNumber%4 == 0) {
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
      else {
        movingRect(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
      }
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle) {
  for (float i=size; i>0; i-=20) {
    // calculate endpoint of the line
    float tempX = x + (size / 2) * sin(angle);
    float tempY = y + (size / 2) * cos(angle);

    fill(255);
    strokeWeight(3);
    stroke(0);
    ellipse(x, y, i, i); // circle
    strokeWeight(1);
    line(x, y, tempX, tempY); // red line

  }
}
void movingRect(float x, float y, float size, float angle) {



  for (float i=size; i>0; i-=20) {


    float tempX = x + (size / 2) * cos(angle);
    float tempY = y + (size / 2) * sin(angle);

    fill(0);
    strokeWeight(3);
    stroke(255);
    rect(x, y, i, i);

    strokeWeight(1);
    line(x, y, tempX, tempY); // red line
  }
}



