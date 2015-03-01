
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Modified sketch width and calculations and randomized color fill
 * Changed shape from square to rectangle
 *   Stephanie Holcomb
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */


color[] randColor = {#FA0D0D, #FFFFFF, #FFFFFF, #FFFFFF ,#FFFFFF,#FFFFFF,#FFFFFF,#FFFFFF}; 
void setup() {
  size(800, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(#02004D); // clear the screen to grey
  
  int num = (int) random(3, 12);   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  //float cellsize = ( width - (num + 1) * gap ) / (float)num;
  float cellsizeheight = (height - (num + 1) * gap) / float(num);
  float cellsizewidth = (width - (num + 1) * gap) / float(num);
  
  // print out the size of each square
  println("gap = " + gap + "  ;  num = " + num + "  ;  cellheight = " + cellsizeheight);
  
  // calculate shadow offset
  float offsetX = cellsizewidth/16.0;
  float offsetY = cellsizeheight/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsizewidth * i + offsetX, gap * (j+1) + cellsizeheight * j + offsetY, cellsizewidth, cellsizeheight);

        //fill(#FFFFFF); // rectangle
        fill(randColor[int(random(0,8))], 250); //rectangle - random color fill
        rect(gap * (i+1) + cellsizewidth * i, gap * (j+1) + cellsizeheight * j, cellsizewidth, cellsizeheight);
      }
    }
} //end of draw 



