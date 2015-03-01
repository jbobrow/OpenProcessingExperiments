
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
}


void draw() {

  background(255); // set screen colour
  
  int num = (int) 5;   // set 5 squares
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1)) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
      for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(random(255),random(255),random(255),175); // rectangle random colours
        int gap = (int) random(10); // select a random gap between each square
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
    
   // press 's' to save drawing
   if(keyPressed == true && key == 's')
    {
       saveFrame("Wk02_3_v1_25Squares.jpg");
    } 
} //end of draw 



