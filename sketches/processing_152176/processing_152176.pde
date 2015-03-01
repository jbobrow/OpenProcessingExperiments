
/*
 * Creative Coding
 * Week 2, 03 - 25 squares
 * by Renzo Wouters
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a 25 squares
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
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        float shiftX = (float) random(-10,10);
        float shiftY = (float) random(-10,10);
        rect(gap * (i+1) + cellsize * i + offsetX + shiftX, gap * (j+1) + cellsize * j + offsetY + shiftY, cellsize, cellsize);
        
        int randomColor = (int) random(0, 100);

        fill(255 - randomColor, 57, 57, 180); // rectangle
        rect(gap * (i+1) + cellsize * i + shiftX, gap * (j+1) + cellsize * j + shiftY, cellsize, cellsize);
      }
    }
} //end of draw 



