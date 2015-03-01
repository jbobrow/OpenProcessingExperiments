
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
  size(600, 600);   //  IDEA: You could change the size of the window 
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}
// IDEA: You could have the framerate changed randomly. The higher the framerate, the faster the changes happen

void draw() {

  background(180); // clear the screen to grey
  // IDEA: You could set the background color to a different color or even to a random color
  
  int num = (int) random(5,6);   // select a random number of squares each frame
  int gap = (int) random(5, 7); // select a random size of the gap between each square
  // IDEA: You could change the limits of the random numbers of squares and/or the size of the gaps
  
  // calculate the size of each square for the given number of squares and the gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 
  int colorNumber1;  // ADDED CODE / make color random
  int colorNumber2; 
  int colorNumber3;
  int shapeShadow;  // ADDED CODE / make shadow shape random
  int gapRandom; // ADDED CODE / make gaps random

    
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        colorNumber1 = (int) random(1,999);  // ADDED CODE, RANDOM COLOR
        colorNumber2 = (int) random(1,999); 
        colorNumber3 = (int) random(1,999); 
        shapeShadow =  (int) random(1,2); // random number assigned to shapeShadow variable
        gapRandom = (int) random(0,10); // let's try to manipulate the gap size with some random numbers
        
        switch (shapeShadow) {
        case 1:
        fill(140, 180); // shadow looks best in gray, so let's not change that
        rect(gap * (i+1) + cellsize * i + offsetX + gapRandom, gap * (j+1) + cellsize * j + offsetY + gapRandom, cellsize, cellsize);

        fill(colorNumber1, colorNumber2, colorNumber3, 180); // rectangle, you could change the fill color randomly
        rect(gap * (i+1) + cellsize * i + gapRandom, gap * (j+1) + cellsize * j + gapRandom, cellsize, cellsize);
        
        break;

        case 2:
        fill(140, 180); // shadow looks best in gray, so let's not change that
        ellipse(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
        
        fill(colorNumber1, colorNumber2, colorNumber3, 180); // rectangle, you could change the fill color randomly
        rect(gap * (i+1) + cellsize * i + gapRandom, gap * (j+1) + cellsize * j + gapRandom, cellsize, cellsize);

        break;
        }    


    println(shapeShadow, colorNumber1, colorNumber2, colorNumber3 );        
      } // end of FOR inner
    } // end of FOR outer

} //end of draw 



