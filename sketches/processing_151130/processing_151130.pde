
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * tweaked by Neroli Wesley to get a Molnar effect
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
  frameRate(0.5);  // set the frame rate to 1 draw() call per second
  randomSeed(hour() + minute() + second() + millis());
  //noLoop();
}


void draw() {

  background(180); // clear the screen to grey
  //int intest = 4/3;  
  //int num = (int) random(3, 12);   // select a random number of squares each frame
  int num = 5;
  //int gap = (int) random(5, 50); // select a random gap between each square
  int gap = 5;
  int blankBorder = 20;
  // calculate the size of each square for the given number of squares and gap between them
  // leave space for a blank border around the edge so the squares don't touch
  float cellsize = ( (width - blankBorder) - (num + 1) * gap ) / (float)num;
  // print out the size of each square
  println("gap = " + gap);
  println("cellsize = " + cellsize);
  println("random = " + random(-10, 10)); // ran a test to see if int produces a whole number - it does!
  
  // make about a fifth of the squares red - and no more than six red for each version
  int reds = 0;
  for (int i=0; i<num; i++) {     // columns
    for (int j=0; j<num; j++) {  // rows
     float sometimes = random(4);
     sometimes = int(sometimes);
     println("sometimes = " + sometimes);
      if (sometimes == 3) {
        if (reds < 5) {
          fill(#9B0C0C, 200); // rectangle
          reds++;
        }
       } else {
        fill(#481414, 200); // rectangle
       }
        rect(gap * (i+1) + cellsize * i + random(-10, 10) + blankBorder/2, gap * (j+1) + cellsize * j + blankBorder/2 + random(-10, 10), cellsize, cellsize);       
     }
  }
} //end of draw 



