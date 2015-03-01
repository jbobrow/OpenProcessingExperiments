
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
  int num = (int)5; // set 5 squares per row and column
   
  float cellsize = 110;//set size of square
 
    for (int i=0; i<num; i++) {
     for (int j=0; j<num; j++) {
     
      fill(random(20),random (200), random(200),150); // rectangle colours changing
     int gap = (int) random(8); // select a random gap between each square*/    
     rect(gap*(i+1)+cellsize*i,gap*(j+1)+cellsize*j, cellsize, cellsize); //draw a rectangle
     
      // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("25squares.jpg");
       }
      }
     }
    }


//end of draw 



