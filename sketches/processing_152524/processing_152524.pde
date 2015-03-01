
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

  background(180); // clear the screen to grey
  
  int num = 5;   // 5 squares per frame
  int gap = (int) random(5, 10); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/25.0;
  float offsetY = cellsize/25.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        float shiftX = (float) random (-5,5);
        float shiftY = (float) random(-5,5);
        rect(gap * (i+1) + cellsize * i + offsetX + shiftX, gap * (j+1) + cellsize * j + offsetY + shiftY, cellsize, cellsize);

        int randomColor = (int) random(0, 255);
        
        fill(260-randomColor, 57, 57, 180); // rectangle
        rect(gap * (i+1) + cellsize * i + shiftX, gap * (j+1) + cellsize * j + shiftY, cellsize, cellsize);
      }
    }
    // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("25sq.jpg");
  }

} //end of draw 


