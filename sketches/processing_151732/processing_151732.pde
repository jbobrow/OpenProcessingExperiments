
/*
 * Creative Coding Course
 * Week 2, 03 - n squares
 * 
 * Challenge:  try to write a ‘25 Squares generator’, that is, a program that 
 * is capable of generating infinite variations of 25 Squares.
 * Modified by Luvi, June 15th 2014
 * 
 */

void setup() {
  size(500, 500);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(hour() + minute() + second() + millis());
}


void draw() {

  background(250); // clear the screen to grey
  
  int numH = 5;  // five squares for each row
  int gapH = (int) random(5, 10); // select a random horizontal gap between each square in a row
  
  // calculate the size of each square for the given and gap between them
  float cellsize = ( width - (numH + 1) * gapH ) / (float)numH;
  
  // calculate the number of squares in a column
  int numV = (height - gapH) / ((int)cellsize + gapH);
  
  // calculate the resulting vertical gap between each square in a column
  int gapV = (height - numV * (int)cellsize)/(numV + 1);


    for (int i=0; i<numH; i++) {
      for (int j=0; j<numV; j++) {
        
       // rectangle
       // inserting the randomizing of colours
       int c = (int) random(10);
       if (c <= 6) {
       fill(50, 120, 172, 180); 
       }
       else {
       fill(random(255), random(255), random(155), 180);
       }
       
       rect(gapH+random(-5,5) * (i+1) + cellsize * i, gapV+random(-5,5) * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
    
} //end of draw 
