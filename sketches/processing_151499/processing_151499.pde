
/*
 * Adapted from Creative Coding
 * Week 2, 02 - adaptation of 29 Squares by Vera Molnar
 * Inspired by 29 Squares
 * Copyright (c) 2014 Jessica Cheeseman 
 */

// variables:
 int numSq = (5); // sets number of squares
 int canvasSize = 600; //size of canvas
 int borderPercent = 5; // %age size of border each edge
 int borderSize;
 int cellsize; //size of each square
 int gapSize; //size of gap between squares
 int xPosn;
 int yPosn;
 int randX;
 int randY;
 int redd;



void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(15);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(250); 
  
  int num = (int) random(5, 5);   // select a random number of squares each frame
  int gap = (int) random(-50, 20); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
randX = int(random(20))-10 ;
  randY = int(random(20))-10 ;

        fill(247, 57, 57, 50); // rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }  redd = (int) random(11); // choose a colour for each square at random
      if (redd<8) {
        fill(196, 68, 53, 200);
        stroke(196, 68, 53, 200);
      } else if (redd>8) {
        fill(173, 31, 31, 200);
        stroke(167, 18, 18, 200);
      }
 

    }
} //end of draw 


