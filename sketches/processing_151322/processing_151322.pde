
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
  noStroke();
  frameRate(6);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(#7BD825); // clear the screen to green
  
  float b = random(157,227); // color picker ranges
  float g = random(16,16); // color picker ranges
  float r = random(163,227); // color picker ranges
  float a = random(160,240); // alpha range
  
  int num = (4);   // select a random number of squares each frame
  int gap = (int) random(18, 36); // select a random gap between each square
  int corner = (int) random(6, 12); // select a random round corner parameter
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/24.0;
  float offsetY = cellsize/24.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(255, 050); // shadow as ellipse
        ellipse(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        fill(r, g, b, a); // rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize, corner);
      }
    }
} //end of draw 



