
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
  frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(hour()+minute()+second()+millis());
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gapx = (int) random(0, 3); // select a random gap between each square
  int gapy=(int)random(0,3);
  int clr=(int)random(0,5);
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = 118;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  

 
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        gapx=(int)random(1,4);
        gapy=(int)random(1,4);
        clr=(int)random(0,5);

        fill(0,0,0);
         rect(gapx * (i+1) + cellsize * i, gapy * (j+1) + cellsize * j, cellsize, cellsize);
        

        if(clr==4)
         fill(176,14,14);
         else
         fill(155,109,109);
        rect((gapx * (i+1) + (cellsize) * i)+1, (gapy * (j+1) + (cellsize) * j)+1, cellsize-2, cellsize-2);
      }
    }
} //end of draw 



