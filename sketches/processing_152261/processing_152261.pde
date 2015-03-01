
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
  randomSeed(hour()+minute()+second()+millis());
}


void draw() {
  int trueRandomX=0,trueRandomY=0;
  int flag=0;
  background(255); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gap = 6; // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/25.0;
  float offsetY = cellsize/25.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        flag=int(random(11));
        trueRandomX=int(random(15));
        trueRandomY=int(random(15));
        fill(140, 150); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX+trueRandomX, gap * (j+1) + cellsize * j + offsetY+trueRandomY, cellsize, cellsize);
        if (flag%5==0){
          fill(156,59,59,200); // rectangle
          rect(gap * (i+1) + cellsize * i+trueRandomX, (gap * (j+1)) + (cellsize *j)+ trueRandomY, cellsize, cellsize);
          
        }
        else{
          fill(205,55,55,200); // rectangle
          rect(gap * (i+1) + (cellsize * i) +trueRandomX, (gap * (j+1)) + cellsize * j+trueRandomY, cellsize, cellsize);
        }
      }
    }
} //end of draw 
