
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
  randomSeed(day()+hour()+minute()+millis());
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = (int) random(3, 12);   // select a random number of squares each frame
  int gap = (int) random(num, 2*num); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
        
      int gapX = (int) random(gap*1.5);
      int gapY = (int) random(gap*1.5);

      fill(140, 180); // shadow
      rect(gap * i + gapX + cellsize * i + offsetX, gap * j + gapY + cellsize * j + offsetY, cellsize, cellsize);
        
      if ((int) random(6) == 0) {
        fill(247, 57, 57, 180); // rectangle
      }
      else {
        fill(128, 30, 30, 180);
      }
      rect(gap * i + gapX + cellsize * i, gap * j + gapY + cellsize * j, cellsize, cellsize);
    }
  }

  if (keyPressed) {
    switch(key) {
      case 's': {
        noLoop();
        saveFrame("yourName.jpg");
        break;
      }
      case 'q': {
        exit();
        break;
      }
    }
  }
    
} //end of draw 



