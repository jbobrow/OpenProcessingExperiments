
/*
 * This code is an exercise in the Creative Coding program.
 * 
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
    
  frameRate(1);
}


void draw() {
  background(255); // clear the screen to white
  
  int num = 5;
  int gap = (int) random(5, 10); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsize * i + random(16.0), gap * (j+1) + cellsize * j + random(16.0), cellsize, cellsize);

        fill(int(random(170,255)), 57, 57, 180); // rectangle
        rect(gap * (i+int(random(2))) + cellsize * i, gap * (j+int(random(2))) + cellsize * j, cellsize, cellsize);
      }
    }
  
  if (keyPressed == true && key == 's'){
    saveFrame("25Blocks.jpg");
    println("frame is saved");
  }

} //end of draw 

