
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
 * Updated 21/06/14 by David Anderson to simulate 25 squares similar to the Vera Molnar "25 Squares"
 *
 * Change the values of gap to change space between squares, gapseed for small random spacing change and randomseed to modify the display
 *
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);     // set the frame rate to 1 draw() call per second
}

void draw() {

  background(180); // clear the screen to grey
  
  int numsq = 5;  // number of squares
  int bord = 10;   // left, top, right & bottom borders
  int gap = 10;     // normal gap between cells
  color c1 = color(143,74,65);  // main colour
  color c2 = color(173,29,28);  // occasional colour
  float rancol;      // randomly choose one of the colours
  float gaph, gapv;  // small vertical and horizontal random spacing
  int gapseed=6;      // maximum gaph and gapv spacing
  
  randomSeed(10);    // repeat same random sequence each frame. Change to a different number to modify the display
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (numsq - 1) * gap - (bord * 2)) / (float)numsq;

  // print out the size of each square
  //  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
  
      for (int i=0; i<numsq; i++) {
        for (int j=0; j<numsq; j++) {

          fill(140, 180); // shadow
          rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

//        fill(247, 57, 57, 180); // rectangle
// fill colour based at random
        rancol=random(100);
        if(rancol<=85.0)
           fill(c1); // rectangle
        else
           fill(c2);

// add small random space horizontally and vertically
        gaph=random(-gapseed,gapseed);
        gapv=random(-gapseed,gapseed);
        
        rect(gap * (i+1) + (cellsize * i) + gaph, gap * (j+1) + (cellsize * j) + gapv, cellsize, cellsize);
      }
    }
    // save your drawing when you press keyboard 's'
    if (keyPressed == true && key=='s') {
      saveFrame("w2_03_2a.jpg");
      println("frame is saved");
  }
} //end of draw 
  
 
