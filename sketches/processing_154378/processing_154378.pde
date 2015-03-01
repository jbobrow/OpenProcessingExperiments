
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
  randomSeed(hour() + minute() + second() + millis());
  frameRate(0.5);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(220); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gap = (int) random(-6,3); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num; 
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/10.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

       float esize = random(100, 255);
       float X = random(-3,1);

        fill(187, 57, 57, esize); // rectangle
        rect(gap * (i+X) + cellsize * i, gap * (j-X) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 



