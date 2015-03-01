
/*
 * Creative Coding
 * Week 2, 04 - The Clocks!
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 *
 * Updated version: this updated version correctly sets margin and gutter distances
 
 * Duplicate the movingCircle function in the code (call it movingCircle2) 
 * and modify this function so that it draws a square clock face, 
 * with the hand moving in the opposite direction. 

 * Next, modify the code inside the nested for loops to call movingCircle 
 * if circleNumber is odd, movingCircle2 otherwise. * 
 
*to test if an integer is even or odd : 
*use the modulo operator (%). 
 
*     if(n % 2 == 0) then n is even.  
* http://www.processing.org/discourse/alpha/board_Syntax_action_display_num_1057290019.html

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
      
      if (circleNumber % 2 == 1) {
      movingCircle2(tx, ty, cellsize, circleNumber * -TWO_PI * millis() / 60000.0);
      }
      else {
            movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);

      }
      
/*                  The expression  circleNumber * TWO_PI * millis() / 60000.0 
 *   calculates the number of minutes that have elapsed since the sketch started running 
 *   (millis() / 60000.0), multiplied by 2π and the circleNumber.
 */ 
    }
  }
}//end of draw 

// creating a function called "movingCircle" -- defining variables

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



void movingCircle2(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * cos(angle);
  float tempY = y + (size / 2) * sin(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  rect(x, y, size, size); // cube

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}

