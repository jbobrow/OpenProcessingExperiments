
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
  //randomSeed(hour() + minute() + second() + millis());
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;
  int gap = (int) random(10, 20);
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        float rani = random(1);
        float ranj = random(1);

        fill(140, 180); // shadow
        rect(gap * (i+rani) + cellsize * i + offsetX, gap * (j+ranj) + cellsize * j + offsetY, cellsize, cellsize);

        fill(random(147, 247), 57, 57, 220); // rectangle
        rect(gap * (i+rani) + cellsize * i, gap * (j+ranj) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 



