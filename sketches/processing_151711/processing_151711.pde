
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
  
  randomSeed(hour() + minute() + second() + millis());
}




void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;
  int gap = 5;
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        int rndX = (int) random(-5, 15);
        int rndY = (int) random(-5, 15);

//        fill(140, 180); // shadow
 //       rect(gap * (i+1) + cellsize * i + offsetX + rndX, gap * (j+1) + cellsize * j + offsetY + rndY, cellsize, cellsize);

        int col = (int) random(0, 10);
        if (col < 2)
        {
          fill(192, 0, 0, 180); // rectangle
        }
        else
        {
          fill(128, 27, 27, 180); // rectangle
        }
        rect(gap * (i+1) + cellsize * i + rndX, gap * (j+1) + cellsize * j + rndY, cellsize, cellsize);
      }
    }
} //end of draw 



