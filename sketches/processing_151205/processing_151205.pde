
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
  size(800, 800);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(hour() + minute() + second() + millis());
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // select a number of squares each frame
  int gap = 5; // select a gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width  - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize;
  float offsetY = cellsize;
 
      for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        if (random(100) > 85) {
          fill(175,12, 0, 200); // sometimes pick this color
        } 
        else {
          fill(111,0,0,200); // usually pick this color
        }
        
        rect(gap*(i+1)+cellsize*i+random(-12, 12), gap*(j+1)+cellsize*j+random(-12, 12), cellsize, cellsize);
      }
    }
    
      // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("w2_03_02.jpg");
  }
} //end of draw 
