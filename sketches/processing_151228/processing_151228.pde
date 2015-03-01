
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
  background(80);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(80);
  noStroke();

  int num = 25;
  int margin = 70;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      int evenodd = (circleNumber%2); // THE MODULO 7000!
      if (evenodd == 0) {  
        thing1(tx, ty, cellsize, circleNumber * TWO_PI * millis() * .000002);
      } else {
        thing2(tx, ty, cellsize, circleNumber * TWO_PI * millis() * .000002);
      }

      
}
  }
}//end of draw 


void thing1(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + 2*((size / 2) * sin(angle));
  float tempY = y + 2*((size / 2) * cos(angle));

  stroke(0);
  noStroke();
  fill(140, 0);
  ellipse(x, y, size, size); // circle

  stroke(0);
  strokeWeight(2);
  line(x, y, tempX, tempY); // red line
  fill(255);
  ellipse(tempX,tempY,10,10);
}

void thing2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + 4*((size / 2) * cos(angle)); // switchy-
  float tempY = y + 4*((size / 2) * sin(angle)); // switch

  stroke(0);
  noStroke();
  fill(140, 0);
  ellipse(x, y, 2*size, 2*size); // circle
  //rect(x,y,size,size);

  stroke(255, 0, 0);
  strokeWeight(2);
  line(x, y, tempX, tempY); // red line
  fill(255,0,0);
  ellipse(tempX,tempY,10,10);
}




