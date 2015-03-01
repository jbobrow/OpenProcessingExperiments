
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
 * ***************************************************************************************************
 * This has been changed to make my version of Vera Molnar's 25 Rectangles
 * uses randomSeed to make small random numbers for gaps and positioning, 
 * uses a If / else to change 20% rectangles to red from brown
 *
 *
 *
 ******************************************************************************************************
 */
 

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(hour() + minute() + second() + millis());
  noLoop(); // run program once 
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5 ;//(int) random(3, 12);   // select a random number of squares each frame
  int gap = (int) random(10); // select a random gap between each square
  int brownSquares = 20; // number of brown squares ( 80% )
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out title
  println("My Version of Vera Molnars's 25 rectangles" );
  
  // calculate shadow offset
  float offsetX = cellsize/random(10 ,25);
  float offsetY = cellsize/random(8, 22);
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        //not using shadow in this program , but may want to later
        //fill(140, 180); // shadow
        //rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
if (random (100) > brownSquares) { //  about 80% of time
        fill(160, 82, 45, 210); }//  rectangles are brown
     else {
       fill( 255, 0, 0, 180); // rectangles are red 
}       // draws 25 rectangles 
        rect(gap * (i+1) + cellsize * i + random (25) , gap * (j+1) + cellsize * j + random (25), cellsize, cellsize);
      }
    }
  
} //end of draw 


