
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  stroke(255, 0, 0);
  strokeWeight(3);
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey

  int num = 5;
  int gap = 10;
  int inner = int (random(2, 9));

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  // calculate offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      for (int k=0; k<inner; k++) {
        if (k == (inner-1)) {
          fill(255, 50, 50, 180); // rectangle
        } 
        else if (i+j == int(random(1,26))) {
          fill(222, 161, 38, 180);
        }
        else {
          noFill();
        }
        float shiftX = random(-10, 10.1);
        float shiftY = random(-10, 10.1);
        rect(shiftX + gap * (i+1) + cellsize * i + k*offsetX, shiftY + gap * (j+1) + cellsize * j + k * offsetY, cellsize-2*k*offsetX, cellsize-2*k*offsetY);
      }
    }
  }
} //end of draw 



