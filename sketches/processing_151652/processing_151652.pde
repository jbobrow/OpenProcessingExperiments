
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/150930*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
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
  
  int num = (5); // set to 25 only
  int gap = (int) random(7,7); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
 // float offsetX = cellsize/16.0;
 // float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

 //       fill(140, 180); // shadow
 //       rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
 
        int r = (int) random (150, 255); // select a random value for red
        fill(r, 57, 57, 180); // rectangle
        gap = (int) random(-2, 10); // select a random gap between each square
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
    
      // saves each frame
 
    //saveFrame("vm-###.jpg");
    
     // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("25_up.jpg");
  }
  
} //end of draw 




