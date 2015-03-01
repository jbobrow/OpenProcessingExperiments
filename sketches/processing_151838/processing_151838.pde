
/*
 * Creative Coding
 * Week 2, 03 - n squares (25 squares version)
 * by Indae Hwang and Jon McCormack, edited by Russell Matbouli
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
  frameRate(0.5);  // set the frame rate to 1 draw() call per second
  randomSeed(0);
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;
  int gap = 10;
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      float offsetX = random(-13, 13);
      float offsetY = random(-13, 13);
      
      fill(random(188,255), random(0, 88), random(0,88), 180); // rectangle
      rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
    }
  }
}



