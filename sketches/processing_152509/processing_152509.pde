
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
  randomSeed(hour() + minute() + millis());
}


void draw() {

  background(180); // clear the screen to grey
  
//  int num = (int) random(3, 12);   // select a random number of squares each frame
  int num = 5;
  int gap = 10;//(int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 
 //float incr = random(0,1);
 
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

//        fill(140, 180); // shadow
//        rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

      
      //Brandon klevence
      //My exercise with a click feature to invert the colors: 
      //http://www.openprocessing.org/sketch/152367
      float fillc = (random(4,10));
      if (fillc <= 5) {
        fill(21, 104, 209, 200);
      } else {
        fill(21, 209, 41, 200);
      }

        rect(random(-2, 2) * (i+1) + cellsize * i, random(-2, 2) * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 

