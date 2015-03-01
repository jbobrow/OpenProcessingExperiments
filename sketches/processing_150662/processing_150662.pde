
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
 
 /*
  * Modified version for completion of exercice 2.5
  * by Joel Matos
  */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.6);  // set the frame rate to 1 draw() call per second
}

void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;
  int gap = 10;
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
  
  
  for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(247 / (i + 1), 57 * (i - 1), 57, random(150, 255)); // rectangle
        if(i == 0 && j != 4)
        {
          rect((gap * (i+1) * random(1, 2)) + (cellsize * i), (gap * (j+1) * random(1, 2)) + (cellsize * j), cellsize, cellsize);
        }
        else
        {
          rect((gap * (i+1) * random(0, 1)) + (cellsize * i), (gap * (j+1) * random(0, 1)) + (cellsize * j), cellsize, cellsize);
        }
      }
    }
  
  
  if (keyPressed)
  {
    switch(key)
    {
      case 's':
        saveFrame("Molnar.jpg");
        break;
    }
  }
} //end of draw



