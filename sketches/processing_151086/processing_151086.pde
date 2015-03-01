
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * tweaked by Neroli Wesley to get the squares evenly in a rectangular bg
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
  size(800, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);  // set the frame rate to 1 draw() call per second
  //noLoop();
}


void draw() {

  background(180); // clear the screen to grey
  //int intest = 4/3;  
  int num = (int) random(3, 12);   // select a random number of squares each frame
  //  int num = 3;
  int gap = (int) random(5, 50); // select a random gap between each square
  //int gap = 2;
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  // calculate how many squares with their gap will fit vertically
 
  int vNum = int (height / (gap + cellsize));
  
  // need to substract one gap before dividing by two even up the spacing at top and bottom
  float vOffset = ((height - ((cellsize + gap) * vNum))-gap)/2; 
  //float vOffset = (((height % cellsize)-gap)/2); // a different attempt at the maths - didn't look right.
  
  // print out the size of each square
  println("gap = " + gap);
  println("cellsize = " + cellsize);
  println("vNum = " + vNum);
  println("vOffset = " + vOffset);
  //println("int = " + intest); // ran a test to see if int produces a whole number - it does!
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 
  // add the vertical offset to each square to push them down and make the spacing even at top and bottom.
    for (int i=0; i<num; i++) {     // columns
      for (int j=0; j<vNum; j++) {  // rows
       
        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY + vOffset, cellsize, cellsize);

        fill(247, 57, 57, 180); // rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j + vOffset, cellsize, cellsize);
        
      }
    }
} //end of draw 



