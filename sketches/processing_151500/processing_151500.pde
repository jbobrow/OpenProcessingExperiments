
/*
 * Adapted from Creative Coding
 * Week 2, 02 - Nine Squares, part 2
 * Inspired by 25 Squares by Vera Molnar
 * Copyright (c) 2014 Jessica Cheeseman
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(5);  // set the frame rate to 5 draw() call per second
}


void draw() {

  background(180);
  
  int num = (int) random(5, 5);   // select a random number of squares each frame
  int gap = (int) random(-10, 10); // select a random gap between each square
   float pos1x = (int) random(-50,5); // select a random number for shade position x
  float pos1y = (int) random(-5,10); // select a random number for shade position y
  float pos2x = (int) random(-15,5); // select a random number for square position x
  float pos2y = (int) random(-50,10); // select a random number for square position y
  int rs = (int) random(255,127);
  int gs = (int) random(255,127);
  int bs = (int) random(0,180);
  int rc = (int) random(50,255);
  int gc = (int) random (0,50);
  int bc = (int) random(10,50);

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 2) * gap ) / (float)num;
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

 
        fill(random(rc), random(gc), random(bc), 180);  // rectangle
        rect(gap * (i+1) + cellsize * i + random(pos2x), gap * (j+1) + cellsize * j + random(pos2y), cellsize, cellsize);
      
      }
    }
} //end of draw 




