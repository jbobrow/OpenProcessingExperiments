
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Modified sketch width and calculations and randomized color fill
 * 
 *   Stephanie Holcomb
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */


color[] rainbow = {#FA0D0D, #0725E0, #FC05DC, #6602EA ,#013E12,#0AFAD8,#FAF30A,#FA660A}; 
void setup() {
  size(800, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(#02004D); // clear the screen to grey
  
  int num = (int) random(3, 12);   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  //float cellsize = ( width - (num + 1) * gap ) / (float)num;
  float cellsize = (height - (num + 1) * gap) / float(num);
  
  // print out the size of each square
  println("gap = " + gap + "  ;  num = " + num + "  ;  cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsize * i + ((width - height)/2) + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        //fill(247, 57, 57, 180); // rectangle
        fill(rainbow[int(random(0,8))], 250); //rectangle - random color fill
        rect(gap * (i+1) + cellsize * i + ((width - height)/2), gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 



